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
    _presencesSubscription = presencesManagementActorBloc.listen((state) {
      state.map(
        initial: (value) {},
        actionInProgress: (value) {},
        insertSuccess: (value) {},
        multipleInsertSuccess: (value) {},
        deleteSuccess: (value) {},
        updateSuccess: (value) {},
        actionFailure: (value) {},
        showTimeSlotDialog: (value) {},
      );
    });
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
      getAllUsersPresencesByDate: (e) async* {
        print(e.date.toString());
        yield const PresencesManagementWatcherState.loadInProgress();
        final workstationsOrFailure =
            await workstationRepository.getAllByDate(e.date);
        final usersOrFailure = await userRepository.getAllUsers();
        final workstations = workstationsOrFailure.getOrElse(() => null);
        final users = usersOrFailure.getOrElse(() => null);
        if (users != null && workstations != null) {
          add(PresencesManagementWatcherEvent.presencesReceived(
            _mergeUserWithWorkstations(users, workstations),
          ));
        } else {
          yield PresencesManagementWatcherState.loadFailure();
        }
      },
      presencesReceived: (e) async* {
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
        yield PresencesManagementWatcherState.loadSuccess(
          resourcesPending ?? List.empty(),
          resourcesConfirmed ?? List.empty(),
          resourcesRefusedOrAbsent ?? List.empty(),
        );
      },
      onFilterUpdated: (e) async* {},
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
}
