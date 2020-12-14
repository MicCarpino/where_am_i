import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/users/get_logged_user.dart';
import 'package:where_am_i/domain/usecases/workstations/get_user_presences.dart';
import 'package:where_am_i/domain/usecases/workstations/insert_all_workstations.dart';
import 'package:where_am_i/domain/usecases/workstations/insert_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/remove_workstation.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation.dart';

part 'my_presences_event.dart';

part 'my_presences_state.dart';

class MyPresencesBloc extends Bloc<MyPresencesEvent, MyPresencesState> {
  final GetUserPresences _getUserPresences;
  final InsertWorkstation _insertUserPresence;
  final InsertAllWorkstations _insertAllUserPresences;
  final RemoveWorkstation _removeUserPresence;
  final UpdateWorkstation _updateUserPresence;
  final GetLoggedUser _getLoggedUser;

  MyPresencesBloc({
    @required GetUserPresences getUserPresences,
    @required InsertWorkstation insertUserPresence,
    @required InsertAllWorkstations insertAllUserPresences,
    @required RemoveWorkstation removeUserPresence,
    @required UpdateWorkstation updateUserPresence,
    @required GetLoggedUser getLoggedUser,
  })  : assert(getUserPresences != null),
        assert(insertUserPresence != null),
        assert(insertAllUserPresences != null),
        assert(removeUserPresence != null),
        assert(updateUserPresence != null),
        assert(getLoggedUser != null),
        _getUserPresences = getUserPresences,
        _insertUserPresence = insertUserPresence,
        _insertAllUserPresences = insertAllUserPresences,
        _removeUserPresence = removeUserPresence,
        _updateUserPresence = updateUserPresence,
        _getLoggedUser = getLoggedUser,
        super(MyPresencesInitial());

  List<Workstation> cachedPresences;

  @override
  Stream<MyPresencesState> mapEventToState(MyPresencesEvent event) async* {
    if (event is FetchCurrentUserPresences) {
      yield* _fetchCurrentUserPresences();
    } else if (event is OnPresenceAdded) {
      yield* _insertLoggedUserPresence(event.newPresenceParams);
    } else if (event is OnMultiplePresencesAdded) {
      yield* _insertMultipleLoggedUserPresences(event.newPresencesParams);
    } else if (event is OnPresenceRemoved) {
      yield* _removeLoggedUserPresence(event.idWorkstation);
    } else if (event is OnPresenceUpdate) {
      yield* _updateLoggedUserPresence(
          event.workstationToUpdate, event.newPresenceParams);
    }
  }

  Stream<MyPresencesState> _fetchCurrentUserPresences() async* {
    yield PresencesFetchLoadingState();
    print('fetching user presences');
    final userPresences = await _getUserPresences(NoParams());
    yield userPresences.fold((failure) {
      print('presences fetch fail');
      return PresencesFetchErrorState();
    }, (userPresences) {
      cachedPresences = userPresences;
      print('presences fetch success');
      return PresencesFetchCompletedState(userPresences);
    });
  }

  Stream<MyPresencesState> _insertLoggedUserPresence(
      PresenceNewParameters newPresenceParams) async* {
    print('inserting user presence');
    var loggedUser = await _getLoggedUser(NoParams());
    var idResourceOrFailure = loggedUser.fold(
      (failure) => failure,
      (authenticatedUser) => authenticatedUser.user.idResource,
    );
    if (idResourceOrFailure is String) {
      Workstation newWorkstation = Workstation(
        idWorkstation: null,
        idResource: idResourceOrFailure,
        freeName: newPresenceParams.freeName,
        workstationDate: newPresenceParams.date,
        codeWorkstation: null,
        startTime: newPresenceParams.startTime,
        endTime: newPresenceParams.endTime,
        status: WORKSTATION_STATUS_PENDING,
      );
      final insertResult = await _insertUserPresence(newWorkstation);
      yield insertResult.fold((failure) {
        print('insert presence failure');
        return PresencesErrorMessageState(_getErrorMessageFromFailure(failure));
      }, (insertedPresence) {
        print('insert presence success');
        if (cachedPresences != null) {
          print('valid presences cache');
          cachedPresences.add(insertedPresence);
          return PresencesFetchCompletedState(cachedPresences);
        } else {
          print('invalid  presences cache');
          _fetchCurrentUserPresences();
          return null;
        }
      });
    } else {
      yield PresencesErrorMessageState(
          _getErrorMessageFromFailure(idResourceOrFailure));
    }
  }

  Stream<MyPresencesState> _insertMultipleLoggedUserPresences(
      List<PresenceNewParameters> newPresencesParams) async* {
    var loggedUser = await _getLoggedUser(NoParams());
    var idResourceOrFailure = loggedUser.fold(
      (failure) => failure,
      (authenticatedUser) => authenticatedUser.user.idResource,
    );
    if (idResourceOrFailure is String) {
      var workstations = newPresencesParams.map((e) => Workstation(
            idWorkstation: null,
            idResource: idResourceOrFailure,
            freeName: e.freeName,
            workstationDate: e.date,
            codeWorkstation: null,
            startTime: e.startTime,
            endTime: e.endTime,
            status: WORKSTATION_STATUS_PENDING,
          )).toList();
      final insertResult = await _insertAllUserPresences(workstations);
      yield insertResult.fold((failure) {
        print('insert presence failure');
        return PresencesErrorMessageState(_getErrorMessageFromFailure(failure));
      }, (insertedPresences) {
        print('insert presence success');
        if (cachedPresences != null) {
          print('valid presences cache');
          cachedPresences.addAll(insertedPresences);
          return PresencesFetchCompletedState(cachedPresences);
        } else {
          print('invalid  presences cache');
          _fetchCurrentUserPresences();
          return null;
        }
      });
    } else {
      yield PresencesErrorMessageState(
          _getErrorMessageFromFailure(idResourceOrFailure));
    }
  }

  Stream<MyPresencesState> _updateLoggedUserPresence(
      Workstation currentWorkstation, PresenceNewParameters newParams) async* {
    Workstation updatedWorkstation = Workstation(
        idWorkstation: currentWorkstation.idWorkstation,
        idResource: currentWorkstation.idResource,
        workstationDate: currentWorkstation.workstationDate,
        codeWorkstation: currentWorkstation.codeWorkstation,
        status: WORKSTATION_STATUS_PENDING,
        startTime: newParams.startTime,
        endTime: newParams.endTime);
    print('updating user presence');
    final updateResult = await _updateUserPresence(updatedWorkstation);
    yield updateResult.fold((failure) {
      print('remove presence failure');
      return PresencesErrorMessageState(_getErrorMessageFromFailure(failure));
    }, (updatedPresence) {
      print('update presence success');
      if (cachedPresences != null) {
        print('valid  presences cache');
        cachedPresences[cachedPresences.indexWhere((element) =>
                element.idWorkstation == updatedPresence.idWorkstation)] =
            updatedPresence;
        return PresencesFetchCompletedState(cachedPresences);
      } else {
        print('invalid  presences cache');
        _fetchCurrentUserPresences();
        return null;
      }
    });
  }

  Stream<MyPresencesState> _removeLoggedUserPresence(int idWorkstation) async* {
    print('removing user presence');
    final removeResult = await _removeUserPresence(idWorkstation);
    yield removeResult.fold((failure) {
      print('remove presence failure');
      return PresencesErrorMessageState(_getErrorMessageFromFailure(failure));
    }, (deletedPresenceId) {
      print('delete presence success');
      if (cachedPresences != null) {
        print('valid  presences cache');
        cachedPresences.removeWhere(
            (element) => element.idWorkstation == deletedPresenceId);
        return PresencesFetchCompletedState(cachedPresences);
      } else {
        print('invalid  presences cache');
        _fetchCurrentUserPresences();
        return null;
      }
    });
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
}
