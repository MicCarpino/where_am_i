import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_all_users_presences_by_date.dart';
import 'package:where_am_i/domain/usecases/workstations/insert_all_workstations.dart';
import 'package:where_am_i/domain/usecases/workstations/insert_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/remove_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation_status.dart';

part 'presences_management_event.dart';

part 'presences_management_state.dart';

class PresencesManagementBloc
    extends Bloc<PresencesManagementEvent, PresencesManagementState> {
  final GetAllUserPresencesByDate getAllUserPresencesByDate;
  final InsertWorkstation _insertUserPresence;
  final InsertAllWorkstations _insertAllUserPresences;
  final RemoveWorkstation _removeUserPresence;
  final UpdateWorkstation _updateUserPresence;
  final UpdateWorkstationStatus _updateUserPresenceStatus;

  PresencesManagementBloc({
    @required GetAllUserPresencesByDate getAllUserPresencesByDate,
    @required InsertWorkstation insertUserPresence,
    @required InsertAllWorkstations insertAllUserPresences,
    @required RemoveWorkstation removeUserPresence,
    @required UpdateWorkstation updateUserPresence,
    @required UpdateWorkstationStatus updateUserPresenceStatus,
  })  : assert(getAllUserPresencesByDate != null),
        assert(insertUserPresence != null),
        assert(insertAllUserPresences != null),
        assert(removeUserPresence != null),
        assert(updateUserPresence != null),
        assert(updateUserPresenceStatus != null),
        getAllUserPresencesByDate = getAllUserPresencesByDate,
        _insertUserPresence = insertUserPresence,
        _insertAllUserPresences = insertAllUserPresences,
        _removeUserPresence = removeUserPresence,
        _updateUserPresence = updateUserPresence,
        _updateUserPresenceStatus = updateUserPresenceStatus,
        super(PresencesManagementInitial());

  List<UserWithWorkstation> originalUsersPresencesList;

  @override
  Stream<PresencesManagementState> mapEventToState(
    PresencesManagementEvent event,
  ) async* {
    if (event is OnUsersPresencesFetchRequested) {
      yield* _fetchAllUsersPresences(event.dateToFetch);
    } else if (event is OnPresenceAddedByManagement) {
      yield* _insertPresence(event.newPresenceParams);
    } else if (event is OnMultiplePresencesAddedByManagement) {
      yield* _insertMultiplePresences(event.newPresenceParams);
    } else if (event is OnPresenceRemovedByManagement) {
      yield* _removePresence(event.idWorkstation);
    } else if (event is OnPresenceUpdatedByManagement) {
      yield* _updatePresence(
          event.workstationToUpdate, event.updatedPresenceParams);
    } else if (event is OnUserPresenceStatusUpdate) {
      yield* _updatePresenceStatus(event.workstationStatusParameters);
    } else if (event is OnUsersPresencesFilterUpdate) {
      yield* _applyFilterToList(event.filterInput);
    }
  }

  Stream<PresencesManagementState> _fetchAllUsersPresences(
      DateTime date) async* {
    yield PresencesManagementFetchLoadingState();
    print('fetching all users presences');
    final userPresences = await getAllUserPresencesByDate(date);
    yield userPresences.fold((failure) {
      print('all users presences fail');
      return PresencesManagementFetchErrorState();
    }, (allUserPresences) {
      print('all users user presences');
      originalUsersPresencesList = allUserPresences;
      var sortedList = _sortAndPublish(originalUsersPresencesList);
      return PresencesManagementFetchCompletedState(sortedList);
    });
  }

  Stream<PresencesManagementState> _insertPresence(
      PresenceNewParameters newPresenceParams) async* {
    print('inserting user presence');
    Workstation newWorkstation = Workstation(
      idWorkstation: null,
      idResource: newPresenceParams.idResource,
      freeName: newPresenceParams.freeName,
      workstationDate: newPresenceParams.date,
      codeWorkstation: null,
      startTime: newPresenceParams.startTime,
      endTime: newPresenceParams.endTime,
      status: WORKSTATION_STATUS_CONFIRMED,
    );
    final insertResult = await _insertUserPresence(newWorkstation);
    yield insertResult.fold((failure) {
      print('insert presence failure');
      return PresencesManagementErrorMessageState(
          _getErrorMessageFromFailure(failure));
    }, (insertedPresence) {
      print('insert presence success');
      if (originalUsersPresencesList != null) {
        print('valid presences cache');
        var index = originalUsersPresencesList.indexWhere((element) =>
            insertedPresence.idResource != null
                ? element.user?.idResource == insertedPresence.idResource
                : element.workstation?.freeName == insertedPresence.freeName);
        // no element found, inserting new object
        if (index == -1) {
          //TODO: replace insert method with add when implementing list sorting
          originalUsersPresencesList.insert(0,
              UserWithWorkstation(user: null, workstation: insertedPresence));
        } else {
          // element found, assigning workstation
          originalUsersPresencesList[index] = UserWithWorkstation(
              user: originalUsersPresencesList[index].user,
              workstation: insertedPresence);
        }
        return PresencesManagementFetchCompletedState(
            originalUsersPresencesList);
      } else {
        print('invalid  presences cache');
        _fetchAllUsersPresences(newPresenceParams.date);
        return null;
      }
    });
  }

  Stream<PresencesManagementState> _insertMultiplePresences(
      List<PresenceNewParameters> newPresenceParams) async* {
    print('inserting multiple user presence');
    var newWorkstations = newPresenceParams
        .map((e) => Workstation(
              idWorkstation: null,
              idResource: e.idResource,
              freeName: e.freeName,
              workstationDate: e.date,
              codeWorkstation: null,
              startTime: e.startTime,
              endTime: e.endTime,
              status: WORKSTATION_STATUS_CONFIRMED,
            ))
        .toList();

    final insertResult = await _insertAllUserPresences(newWorkstations);
    yield insertResult.fold((failure) {
      print('insert presence failure');
      return PresencesManagementErrorMessageState(
          _getErrorMessageFromFailure(failure));
    }, (insertedPresences) {
      print('insert presence success');
      if (originalUsersPresencesList != null) {
        print('valid presences cache');
        insertedPresences.forEach((presence) {
          var index = originalUsersPresencesList.indexWhere((element) =>
          presence.idResource != null
              ? element.user?.idResource == presence.idResource
              : element.workstation?.freeName == presence.freeName);
          // no element found, inserting new object
          if (index == -1) {
            //TODO: replace insert method with add when implementing list sorting
            originalUsersPresencesList.insert(0,
                UserWithWorkstation(user: null, workstation: presence));
          } else {
            // element found, assigning workstation
            originalUsersPresencesList[index] = UserWithWorkstation(
                user: originalUsersPresencesList[index].user,
                workstation: presence);
          }
        });
        return PresencesManagementFetchCompletedState(originalUsersPresencesList);
      } else {
        print('invalid  presences cache');
        _fetchAllUsersPresences(newPresenceParams.first.date);
        return null;
      }
    });
  }

  Stream<PresencesManagementState> _updatePresence(
      Workstation currentWorkstation, PresenceNewParameters newParams) async* {
    Workstation updatedWorkstation = Workstation(
        idWorkstation: currentWorkstation.idWorkstation,
        idResource: currentWorkstation.idResource,
        freeName: currentWorkstation.freeName,
        workstationDate: currentWorkstation.workstationDate,
        codeWorkstation: currentWorkstation.codeWorkstation,
        status: WORKSTATION_STATUS_CONFIRMED,
        startTime: newParams.startTime,
        endTime: newParams.endTime);
    print('updating user presence');
    final updateResult = await _updateUserPresence(updatedWorkstation);
    yield updateResult.fold((failure) {
      print('remove presence failure');
      return PresencesManagementErrorMessageState(
          _getErrorMessageFromFailure(failure));
    }, (updatedPresence) {
      print('update presence success');
      if (originalUsersPresencesList != null) {
        print('valid presences cache');
        var index = originalUsersPresencesList.indexWhere((element) =>
            updatedPresence.idResource != null
                ? element.user?.idResource == updatedPresence.idResource
                : element.workstation?.freeName == updatedPresence.freeName);
        originalUsersPresencesList[index] = UserWithWorkstation(
            user: originalUsersPresencesList[index]?.user,
            workstation: updatedPresence);
        return PresencesManagementFetchCompletedState(
            originalUsersPresencesList);
      } else {
        print('invalid  presences cache');
        _fetchAllUsersPresences(newParams.date);
        return null;
      }
    });
  }

  Stream<PresencesManagementState> _updatePresenceStatus(
      WorkstationStatusParameters workstationStatusParameters) async* {
    final statusUpdateResult =
        await _updateUserPresenceStatus(workstationStatusParameters);
    yield statusUpdateResult.fold(
        (failure) => PresencesManagementErrorMessageState(
            _getErrorMessageFromFailure(failure)), (updatedPresence) {
      print('update presence success');
      if (originalUsersPresencesList != null) {
        print('valid presences cache');
        var index = originalUsersPresencesList.indexWhere((element) =>
            updatedPresence.idResource != null
                ? element.user?.idResource == updatedPresence.idResource
                : element.workstation?.freeName == updatedPresence.freeName);
        originalUsersPresencesList[index] = UserWithWorkstation(
            user: originalUsersPresencesList[index]?.user,
            workstation: updatedPresence);
        return PresencesManagementFetchCompletedState(
            originalUsersPresencesList);
      } else {
        print('invalid  presences cache');
        //TODO: refetch
        //_fetchAllUsersPresences();
        return null;
      }
    });
  }

  Stream<PresencesManagementState> _removePresence(int idWorkstation) async* {
    print('removing user presence');
    final removeResult = await _removeUserPresence(idWorkstation);
    yield removeResult.fold((failure) {
      print('remove presence failure');
      return PresencesManagementErrorMessageState(
          _getErrorMessageFromFailure(failure));
    }, (deletedPresenceId) {
      print('delete presence success');
      if (originalUsersPresencesList != null) {
        print('valid  presences cache');
        var index = originalUsersPresencesList.indexWhere((element) =>
            element.workstation?.idWorkstation == deletedPresenceId);
        if (originalUsersPresencesList[index].user != null) {
          originalUsersPresencesList[index] = UserWithWorkstation(
              user: originalUsersPresencesList[index].user, workstation: null);
        } else {
          originalUsersPresencesList.removeAt(index);
        }
        return PresencesManagementFetchCompletedState(
            originalUsersPresencesList);
      } else {
        print('invalid  presences cache');
        //TODO: refetch
        //_fetchAllUsersPresences();
        return null;
      }
    });
  }

  Stream<PresencesManagementState> _applyFilterToList(
      String filterInput) async* {
    if (filterInput.isEmpty) {
      yield PresencesManagementFetchCompletedState(originalUsersPresencesList);
    } else {
      var filteredList = originalUsersPresencesList
          .where((user) => user.user != null
              ? user.user.name
                      .toLowerCase()
                      .contains(filterInput.toLowerCase()) ||
                  user.user.surname
                      .toLowerCase()
                      .contains(filterInput.toLowerCase())
              : user.workstation.freeName
                  .toLowerCase()
                  .contains(filterInput.toLowerCase()))
          .toList();
      yield PresencesManagementFetchCompletedState(filteredList);
    }
  }

  /*List<UserWithWorkstation> mergeAndSortUsersWithWorkstations(
      List<Workstation> workstations, List<User> users) {
    List<UserWithWorkstation> usersWithWorkstations = users.map((user) {
      Workstation relatedWorkstation = workstations.firstWhere(
              (workstation) => workstation.idResource == user.idResource,
          orElse: () => null);
      return UserWithWorkstation(user: user, workstation: relatedWorkstation);
    }).toList();
    usersWithWorkstations
        .sort((a, b) => a.user.surname.compareTo(b.user.surname));
    //Free name users
    List<UserWithWorkstation> freeNamesWorkstations = workstations
        .where((workstation) => workstation.freeName != null)
        .map((workstation) =>
        UserWithWorkstation(user: null, workstation: workstation))
        .toList();
    freeNamesWorkstations.sort(
            (a, b) => a.workstation.freeName.compareTo(b.workstation.freeName));
    return List.of(freeNamesWorkstations..addAll(usersWithWorkstations));
  }*/

  _sortAndPublish(List<UserWithWorkstation> list) {
    List<UserWithWorkstation> resourcesPending = list
        .where((element) =>
            element.workstation?.status == WORKSTATION_STATUS_PENDING &&
            element.user != null)
        .toList();
    resourcesPending.sortBySurnameAndName();
    List<UserWithWorkstation> freeNamePending = list
        .where((element) =>
            element.workstation?.status == WORKSTATION_STATUS_PENDING &&
            element.workstation?.freeName != null)
        .toList();
    freeNamePending.sortByFreeName();
    List<UserWithWorkstation> resourcesConfirmed = list
        .where((element) =>
            element.workstation?.status == WORKSTATION_STATUS_CONFIRMED &&
            element.user != null)
        .toList();
    resourcesConfirmed.sortBySurnameAndName();
    List<UserWithWorkstation> freeNameConfirmed = list
        .where((element) =>
            element.workstation?.status == WORKSTATION_STATUS_CONFIRMED &&
            element.workstation?.freeName != null)
        .toList();
    freeNameConfirmed.sortByFreeName();
    List<UserWithWorkstation> resources =
        list.where((element) => element.workstation == null).toList();
    resources.sortBySurnameAndName();
    List<UserWithWorkstation> sortedList = List<UserWithWorkstation>();
    sortedList.addAll(freeNamePending);
    sortedList.addAll(resourcesPending);
    sortedList.addAll(freeNameConfirmed);
    sortedList.addAll(resourcesConfirmed);
    sortedList.addAll(resources);
    return sortedList;
  }

  String _getErrorMessageFromFailure(Failure failure) {
    String message = "Si è verificato un errore";
    if (failure is ServerFailure) {
      message = failure.errorMessage;
    } else if (failure is UnexpectedFailure) {
      message = failure.errorMessage;
    } else if (failure is CacheFailure) {
      message = "Errore cache";
    }
    print('FAILURE: $message');
    return message;
  }
}
