import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_date.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_id_resource.dart';
import 'package:where_am_i/domain/usecases/update_user_presences.dart';

part 'workstation_event.dart';

part 'workstation_state.dart';

class WorkstationBloc extends Bloc<WorkstationEvent, WorkstationState> {
  final GetWorkstationsByDate getWorkstationsByDate;
  final GetWorkstationsByIdResource getWorkstationsByIdResource;
  final UpdateUserPresences updateUserPresences;

  WorkstationBloc({
    @required GetWorkstationsByDate getWorkstationsByDate,
    @required GetWorkstationsByIdResource getWorkstationsByIdResource,
    @required UpdateUserPresences updateUserPresences,
  })  : assert(getWorkstationsByDate != null),
        assert(getWorkstationsByIdResource != null),
        assert(updateUserPresences != null),
        getWorkstationsByDate = getWorkstationsByDate,
        getWorkstationsByIdResource = getWorkstationsByIdResource,
        updateUserPresences = updateUserPresences,
        super(WorkstationInitial());

  @override
  Stream<WorkstationState> mapEventToState(
    WorkstationEvent event,
  ) async* {
    if (event is FetchWorkstationsLists) {
      yield*  _fetchWorkstationsList(event);
    } else if (event is FetchUserPresences) {
      yield* _fetchUserPresences();
    } else if (event is OnPresencesUpdate) {
      _updateUserPresences(event.updatedPresences);
    }
  }

  Stream<WorkstationState> _fetchWorkstationsList(FetchWorkstationsLists event) async* {
    yield WorkstationsFetchLoadingState();
    print('fetching workstations for ${event.dateToFetch}');
    final workstationsList = await getWorkstationsByDate(event.dateToFetch);
    yield workstationsList.fold((failure) {
      print(
          'workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return WorkstationsFetchErrorState();
    }, (workstations) {
      print('workstations : ${workstations.toList()}');
      return WorkstationsFetchCompletedState(workstations);
    });
  }

  Stream<WorkstationState> _fetchUserPresences() async* {
    yield WorkstationsFetchLoadingState();
    print('fetching user presences');
    final userPresences = await getWorkstationsByIdResource(NoParams());
    yield userPresences.fold((failure) {
      print(
          'user presences fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return WorkstationsFetchErrorState();
    }, (userPresences) {
      print('user presences : ${userPresences.length}');
      return UserPresencesFetchCompleted(userPresences);
    });
  }

  void _updateUserPresences(List<DateTime> updatedPresences) {
    updateUserPresences(updatedPresences);
  }
}
