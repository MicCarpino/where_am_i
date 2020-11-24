import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_user_presences.dart';
import 'package:where_am_i/domain/usecases/insert_user_presence.dart';
import 'package:where_am_i/domain/usecases/remove_user_presence.dart';

part 'my_presences_event.dart';

part 'my_presences_state.dart';

class MyPresencesBloc extends Bloc<MyPresencesEvent, MyPresencesState> {
  final GetUserPresences _getUserPresences;
  final InsertUserPresence _insertUserPresence;
  final RemoveUserPresence _removeUserPresence;

  MyPresencesBloc({
    @required GetUserPresences getUserPresences,
    @required InsertUserPresence insertUserPresence,
    @required RemoveUserPresence removeUserPresence,
  })  : assert(getUserPresences != null),
        assert(insertUserPresence != null),
        assert(removeUserPresence != null),
        _getUserPresences = getUserPresences,
        _insertUserPresence = insertUserPresence,
        _removeUserPresence = removeUserPresence,
        super(MyPresencesInitial());

  List<Workstation> cachedPresences;

  @override
  Stream<MyPresencesState> mapEventToState(MyPresencesEvent event) async* {
    if (event is FetchCurrentUserPresences) {
      yield* _fetchCurrentUserPresences();
    } else if (event is OnPresenceAdded) {
      yield* _insertPresence(
        NewPresenceParams(
            date: event.date,
            startTime: event.startTime,
            endTime: event.endTime),
      );
    } else if (event is OnPresenceRemoved) {
      yield* _removePresence(event.idWorkstation);
    }
  }

  Stream<MyPresencesState> _fetchCurrentUserPresences() async* {
    yield PresencesFetchLoadingState();
    print('fetching user presences');
    final userPresences = await _getUserPresences(NoParams());
    yield userPresences.fold((failure) {
      print( 'presences fetch fail');
      return PresencesFetchErrorState();
    }, (userPresences) {
      cachedPresences = userPresences;
      print('presences fetch success');
      return PresencesFetchCompletedState(userPresences);
    });
  }

  Stream<MyPresencesState> _insertPresence(
      NewPresenceParams newPresenceParams) async* {
    print('inserting user presence');
    final insertResult = await _insertUserPresence(newPresenceParams);
    yield insertResult.fold((failure) {
      print('insert presence failure');
      return PresencesErrorMessageState(_getErrorMessage(failure));
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
  }

  Stream<MyPresencesState> _removePresence(int idWorkstation) async* {
    print('removing user presence');
    final removeResult = await _removeUserPresence(idWorkstation);
    yield removeResult.fold((failure) {
      print('remove presence failure');
      return PresencesErrorMessageState(_getErrorMessage(failure));
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

 String _getErrorMessage(Failure failure){
    String message = "Si è verificato un errore";
    if(failure is ServerFailure){
      message = failure.errorMessage;
    } else if (failure is UnexpectedFailure){
      message =failure.errorMessage;
    } else if (failure is CacheFailure){
      message = "Errore cache";
    }
    return message;
}
}
