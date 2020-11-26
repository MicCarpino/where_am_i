import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_all_users_presences_by_date.dart';
import 'package:where_am_i/domain/usecases/workstations/insert_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/remove_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation.dart';

part 'presences_management_event.dart';

part 'presences_management_state.dart';

class PresencesManagementBloc
    extends Bloc<PresencesManagementEvent, PresencesManagementState> {
  final GetAllUserPresencesByDate getAllUserPresencesByDate;
  final InsertWorkstation _insertUserPresence;
  final RemoveWorkstation _removeUserPresence;
  final UpdateWorkstation _updateUserPresence;

  PresencesManagementBloc({
    @required GetAllUserPresencesByDate getAllUserPresencesByDate,
    @required InsertWorkstation insertUserPresence,
    @required RemoveWorkstation removeUserPresence,
    @required UpdateWorkstation updateUserPresence,
  })  : assert(getAllUserPresencesByDate != null),
        assert(insertUserPresence != null),
        assert(removeUserPresence != null),
        assert(updateUserPresence != null),
        getAllUserPresencesByDate = getAllUserPresencesByDate,
        _insertUserPresence = insertUserPresence,
        _removeUserPresence = removeUserPresence,
        _updateUserPresence = updateUserPresence,
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
    } else if (event is OnPresenceRemovedByManagement) {
      yield* _removePresence(event.idWorkstation);
    } else if (event is OnPresenceUpdatedByManagement) {
      yield* _updatePresence(
          event.workstationToUpdate, event.updatedPresenceParams);
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
      return PresencesManagementFetchCompletedState(allUserPresences);
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
            element.user.idResource == insertedPresence.idResource);
        originalUsersPresencesList[index] = UserWithWorkstation(
            user: originalUsersPresencesList[index].user,
            workstation: insertedPresence);
        return PresencesManagementFetchCompletedState(
            originalUsersPresencesList);
      } else {
        print('invalid  presences cache');
        _fetchAllUsersPresences(newPresenceParams.date);
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
        var index = originalUsersPresencesList.indexWhere(
            (element) => element.user.idResource == updatedPresence.idResource);
        originalUsersPresencesList[index] = UserWithWorkstation(
            user: originalUsersPresencesList[index].user,
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
            element.workstation.idWorkstation == deletedPresenceId);
        originalUsersPresencesList[index] = UserWithWorkstation(
            user: originalUsersPresencesList[index].user, workstation: null);
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

  List<UserWithWorkstation> mergeAndSortUsersWithWorkstations(
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
    return message;
  }

 /* Stream<PresencesManagementState> _insertExternalUser(PresenceNewParameters externalUserParams)  async* {
    print('inserting user presence');
    final insertResult = await _insertUserPresence(externalUserParams);
    yield insertResult.fold((failure) {
      print('insert presence failure');
      return PresencesManagementErrorMessageState(
          _getErrorMessageFromFailure(failure));
    }, (insertedPresence) {
      print('insert presence success');
      if (originalUsersPresencesList != null) {
        print('valid presences cache');
        var index = originalUsersPresencesList.indexWhere((element) =>
        element.user.idResource == insertedPresence.idResource);

        originalUsersPresencesList[index] = UserWithWorkstation(
            user: originalUsersPresencesList[index].user,
            workstation: insertedPresence);
        return PresencesManagementFetchCompletedState(
            originalUsersPresencesList);
      } else {
        print('invalid  presences cache');
        _fetchAllUsersPresences(externalUserParams.date);
        return null;
      }
    });
  }*/

}
