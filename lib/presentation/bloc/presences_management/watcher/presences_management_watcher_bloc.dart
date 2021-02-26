import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/bloc/presences_management/actor/presences_management_actor_bloc.dart';

part 'presences_management_watcher_event.dart';

part 'presences_management_watcher_state.dart';

part 'presences_management_watcher_bloc.freezed.dart';

class PresencesManagementWatcherBloc extends Bloc<
    PresencesManagementWatcherEvent, PresencesManagementWatcherState> {
  PresencesManagementWatcherBloc(
    this.workstationRepository,
    this.userRepository,
    this.presencesManagementActorBloc,
  ) : super(PresencesManagementWatcherState.initial()) {
    _presencesSubscription = presencesManagementActorBloc
        .listen((state) => _handleActorStateChange(state));

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
          var c = cachedUsersPresences.where((element) {
            if (element.user != null) {
              return element.user.name
                      .containsCaseInsensitive(e.filterString) ||
                  element.user.surname.containsCaseInsensitive(e.filterString);
            } else if (element.workstation.freeName != null) {
              return element.workstation.freeName
                  .containsCaseInsensitive(e.filterString);
            } else {
              return false;
            }
          }).toList();
          yield PresencesManagementWatcherState.filteredList(c);
        } else {
          add(PresencesManagementWatcherEvent.presencesReceived(
              cachedUsersPresences));
        }
      },
    );
  }

  Stream<PresencesManagementWatcherState> _mapGetPresencesToState(
      _GetUserPresences e) async* {
    yield const PresencesManagementWatcherState.loadInProgress();
    final workstationsOrFailure =
        await workstationRepository.getAllByDate(e.date);
    final usersOrFailure = await userRepository.getAllUsers();
    final workstations = workstationsOrFailure.getOrElse(() => null);
    final users = usersOrFailure.getOrElse(() => null);
    if (users != null && workstations != null) {
      final usersWithWorkstations =
          _mergeUserWithWorkstations(users, workstations);
      cachedUsersPresences = usersWithWorkstations;
      add(
        PresencesManagementWatcherEvent.presencesReceived(
            usersWithWorkstations),
      );
    } else {
      yield PresencesManagementWatcherState.loadFailure();
    }
  }

  Stream<PresencesManagementWatcherState> _mapPresencesReceivedToState(
      _PresencesReceived e) async* {
    //WORKSTATION PENDING - can't have free names
    final resourcesPending = e.usersWithWorkstations
        .where((e) => e.workstation?.status == WORKSTATION_STATUS_PENDING)
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

    //PUBLISH
    yield PresencesManagementWatcherState.loadSuccess(
      resourcesPending ?? List.empty(),
      resourcesConfirmed ?? List.empty(),
      resourcesRefusedOrAbsent ?? List.empty(),
    );
  }

  List<UserWithWorkstation> _mergeUserWithWorkstations(
      List<User> users, List<Workstation> workstations) {
    return workstations
        .where((e) => e.freeName != null)
        .map((freeName) =>
            UserWithWorkstation(user: null, workstation: freeName))
        .toList(growable: true)
          ..addAll(users.map((user) => UserWithWorkstation(
              user: user,
              workstation: workstations.singleWhereOrNull((workstation) =>
                  workstation.idResource == user.idResource))));
  }

  void _handleActorStateChange(PresencesManagementActorState state) {
    state.maybeMap(
      insertSuccess: (value) {
        _updateCachedList(value.workstation);
        add(PresencesManagementWatcherEvent.presencesReceived(
            cachedUsersPresences));
      },
      multipleInsertSuccess: (value) {
        value.workstations.forEach((wrkstn) => _updateCachedList(wrkstn));
        add(PresencesManagementWatcherEvent.presencesReceived(
            cachedUsersPresences));
      },
      deleteSuccess: (value) {
        final index = cachedUsersPresences.indexWhere((element) =>
            element.workstation?.idWorkstation == value.idWorkstation);
        if (index != -1) {
          cachedUsersPresences[index] = UserWithWorkstation(
            user: cachedUsersPresences[index].user,
            workstation: null,
          );
          add(PresencesManagementWatcherEvent.presencesReceived(
              cachedUsersPresences));
        }
      },
      updateSuccess: (value) {
        _updateCachedList(value.workstation);
        add(PresencesManagementWatcherEvent.presencesReceived(
            cachedUsersPresences));
      },
      actionInProgress: (value) => state,
      orElse: () {},
    );
  }

  void _updateCachedList(Workstation workstation) {
    if (workstation.idResource != null) {
      final index = cachedUsersPresences.indexWhere(
          (element) => element.user.idResource == workstation.idResource);
      if (index != -1) {
        cachedUsersPresences[index] =
            cachedUsersPresences[index].copyWith(workstation: workstation);
      }
    } else {
      cachedUsersPresences.add(
        UserWithWorkstation(user: null, workstation: workstation),
      );
    }
  }

  @override
  Future<void> close() {
    _presencesSubscription.cancel();
    return super.close();
  }
}
