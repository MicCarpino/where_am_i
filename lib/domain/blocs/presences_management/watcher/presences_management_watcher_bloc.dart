import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

part 'presences_management_watcher_event.dart';

part 'presences_management_watcher_state.dart';

part 'presences_management_watcher_bloc.freezed.dart';

// this bloc handle the logic for the "presences management" section
// the watcher bloc just handle list fetch and emission, while the operations
// insert/delete/update are performed from the "actor bloc", in order to
// facilitate state handling
class PresencesManagementWatcherBloc extends Bloc<
    PresencesManagementWatcherEvent, PresencesManagementWatcherState> {
  PresencesManagementWatcherBloc(
    this.workstationRepository,
    this.userRepository,
    this.presencesManagementActorBloc,
  ) : super(PresencesManagementWatcherState.initial()) {
    //subscribe to the actor bloc in order to update the list on successful crud operations
    _presencesSubscription = presencesManagementActorBloc
        .listen((state) => _handleActorStateChange(state));
//fetch resources presences for current date on bloc initialization
    add(PresencesManagementWatcherEvent.getAllUsersPresencesByDate(
        DateTime.now()));
  }

  final WorkstationRepository workstationRepository;
  final UserRepository userRepository;
  final PresencesManagementActorBloc presencesManagementActorBloc;
  List<UserWithWorkstation> cachedUsersPresences = List.empty();
  StreamSubscription _presencesSubscription;

  @override
  Stream<PresencesManagementWatcherState> mapEventToState(
    PresencesManagementWatcherEvent event,
  ) async* {
    yield* event.map(
      getAllUsersPresencesByDate: (e) => _mapGetPresencesToState(e),
      presencesReceived: (e) => _mapPresencesReceivedToState(e),
      onFilterUpdated: (e) async* {
        if (e.filterString != null && e.filterString.isNotEmpty) {
          final filteredList = cachedUsersPresences.where((element) {
            if (element.user != null) {
              return e.filterString.split(" ").every((pattern) =>
                  element.user.name.containsCaseInsensitive(pattern) ||
                  element.user.surname.containsCaseInsensitive(pattern));
            } else if (element.workstation.freeName != null) {
              return e.filterString.split(" ").every((pattern) => element
                  .workstation.freeName
                  .containsCaseInsensitive(pattern));
            }
            return false;
          }).toList();
          yield PresencesManagementWatcherState.filteredList(
              filteredList, e.filterString);
        } else {
          add(PresencesManagementWatcherEvent.presencesReceived(
              cachedUsersPresences));
        }
      },
    );
  }

  //fetch presences for a specific date
  Stream<PresencesManagementWatcherState> _mapGetPresencesToState(
      _GetUserPresences e) async* {
    yield const PresencesManagementWatcherState.loadInProgress();
    final workstationsOrFailure =
        await workstationRepository.getAllByDate(e.date);
    final usersOrFailure = await userRepository.getAllUsers();
    final workstations = workstationsOrFailure.getOrElse(() => null);
    final users = usersOrFailure.getOrElse(() => null);
    //if both users and workstations list fetch are successful mix them end emit the list
    if (users != null && workstations != null) {
      final usersWithWorkstations =
          _mergeUserWithWorkstations(users, workstations);
      cachedUsersPresences = usersWithWorkstations;
      add(
        PresencesManagementWatcherEvent.presencesReceived(
            usersWithWorkstations),
      );
    } else {
      //users and/or workstations list fetch failed
      yield PresencesManagementWatcherState.loadFailure();
    }
  }

  //update in the presences list, split in sublist depending on the status and emit the result
  Stream<PresencesManagementWatcherState> _mapPresencesReceivedToState(
      _PresencesReceived e) async* {
    //WORKSTATION PENDING - can't have free names
    final resourcesPending = e.usersWithWorkstations
        .where((e) =>
            e.user != null &&
            e.workstation?.status == WORKSTATION_STATUS_PENDING)
        .toList()
      ..sortBySurnameAndName();

    //WORKSTATIONS CONFIRMED
    final freeNamesConfirmed = e.usersWithWorkstations
        .where((element) =>
            element.workstation?.status == WORKSTATION_STATUS_CONFIRMED &&
            element.user == null)
        .toList()
      ..sortByFreeName();
    final usersConfirmed = e.usersWithWorkstations
        .where((element) =>
            element.workstation?.status == WORKSTATION_STATUS_CONFIRMED &&
            element.user != null)
        .toList()
      ..sortBySurnameAndName();
    final resourcesConfirmed = freeNamesConfirmed..addAll(usersConfirmed);

    //WORKSTATIONS REFUSED or NOT PRESENT
    final resourcesRefusedOrAbsent = e.usersWithWorkstations
        .where((e) =>
            e.workstation == null ||
            e.workstation?.status == WORKSTATION_STATUS_REFUSED)
        .toList()
      ..sortBySurnameAndName();

    //emit the result
    yield PresencesManagementWatcherState.loadSuccess(
      resourcesPending ?? List.empty(),
      resourcesConfirmed ?? List.empty(),
      resourcesRefusedOrAbsent ?? List.empty(),
    );
  }

  // perform the user and workstations list mix
  List<UserWithWorkstation> _mergeUserWithWorkstations(
      List<User> users, List<Workstation> workstations) {
    return workstations
        .where((e) => e.freeName != null)
        .map((freeName) =>
            UserWithWorkstation(user: null, workstation: freeName))
        .toList(growable: true)
      ..addAll(users.map((user) => UserWithWorkstation(
          user: user,
          workstation: workstations.singleWhereOrNull(
              (workstation) => workstation.idResource == user.idResource))));
  }

  //update the list with data coming from the actor bloc
  void _handleActorStateChange(PresencesManagementActorState actorState) {
    actorState.maybeMap(
      insertSuccess: (value) {
        _addToCachedList(value.workstation);
        _publishListUpdateResult();
      },
      multipleInsertSuccess: (value) {
        value.workstations.forEach((wrkstn) => _addToCachedList(wrkstn));
        _publishListUpdateResult();
      },
      deleteSuccess: (value) {
        final index = cachedUsersPresences.indexWhere((element) =>
            element.workstation?.idWorkstation == value.idWorkstation);
        if (index != -1) {
          cachedUsersPresences[index].user != null
              ? cachedUsersPresences[index] = UserWithWorkstation(
                  user: cachedUsersPresences[index].user,
                  workstation: null,
                )
              : cachedUsersPresences.removeAt(index);
          _publishListUpdateResult();
        }
      },
      updateSuccess: (value) {
        _updateCachedList(value.workstation);
        _publishListUpdateResult();
      },
      orElse: () {},
    );
  }

  void _addToCachedList(Workstation workstation) {
    if (workstation.idResource != null) {
      final index = cachedUsersPresences.indexWhere(
          (element) => element.user?.idResource == workstation.idResource);
      if (index != -1) {
        cachedUsersPresences[index] =
            cachedUsersPresences[index].copyWith(workstation: workstation);
      }
    } else if (workstation.freeName != null) {
      cachedUsersPresences
          .add(UserWithWorkstation(user: null, workstation: workstation));
    }
  }

  void _updateCachedList(Workstation workstation) {
    final index = cachedUsersPresences.indexWhere((element) =>
        element.workstation?.idWorkstation == workstation.idWorkstation);
    if (index != -1) {
      cachedUsersPresences[index] =
          cachedUsersPresences[index].copyWith(workstation: workstation);
    }
  }

  void _publishListUpdateResult() {
    state.maybeMap(
      orElse: () => add(PresencesManagementWatcherEvent.presencesReceived(
          cachedUsersPresences)),
      filteredList: (value) => add(
          PresencesManagementWatcherEvent.onFilterUpdated(value.filterString)),
    );
  }

  @override
  Future<void> close() {
    _presencesSubscription.cancel();
    return super.close();
  }
}
