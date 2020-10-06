import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_all_users_presences_by_date.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_date.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_id_resource.dart';
import 'package:where_am_i/domain/usecases/update_user_presences.dart';

part 'workstation_event.dart';

part 'workstation_state.dart';

class WorkstationBloc extends Bloc<WorkstationEvent, WorkstationState> {
  final GetWorkstationsByDate getWorkstationsByDate;
  final GetAllUserPresencesByDate getAllUserPresencesByDate;

  WorkstationBloc({
    @required GetWorkstationsByDate getWorkstationsByDate,
    @required GetAllUserPresencesByDate getAllUserPresencesByDate,
  })  : assert(getWorkstationsByDate != null),
        assert(getAllUserPresencesByDate != null),
        getWorkstationsByDate = getWorkstationsByDate,
        getAllUserPresencesByDate = getAllUserPresencesByDate,
        super(WorkstationInitial());

  @override
  Stream<WorkstationState> mapEventToState(
    WorkstationEvent event,
  ) async* {
    if (event is FetchWorkstationsLists) {
      yield* _fetchWorkstationsList(event.dateToFetch);
    } else if (event is FetchAllUserPresences) {
      yield* _fetchAllUsersPresences(event.dateToFetch);
    }
  }

  Stream<WorkstationState> _fetchWorkstationsList(
      DateTime dateToFetch) async* {
    yield WorkstationsFetchLoadingState();
    print('fetching workstations for $dateToFetch');
    final workstationsList = await getWorkstationsByDate(dateToFetch);
    yield workstationsList.fold((failure) {
      print(
          'workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return WorkstationsFetchErrorState();
    }, (workstations) {
      print('workstations : ${workstations.toList()}');
      return WorkstationsFetchCompletedState(workstations);
    });
  }

  Stream<WorkstationState> _fetchAllUsersPresences(DateTime date) async* {
    yield WorkstationsFetchLoadingState();
    print('fetching all users presences');
    final userPresences = await getAllUserPresencesByDate(date);
    yield userPresences.fold((failure) {
      print(
          'all users presences fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return WorkstationsFetchErrorState();
    }, (allUserPresences) {
      print('all users user presences : ${userPresences.length}');
      return AllUsersPresencesFetchCompleted(allUserPresences);
    });
  }
}
