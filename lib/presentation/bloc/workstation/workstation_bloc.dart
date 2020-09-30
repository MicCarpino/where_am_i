import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_date.dart';

part 'workstation_event.dart';

part 'workstation_state.dart';

class WorkstationBloc extends Bloc<WorkstationEvent, WorkstationState> {
  final GetWorkstationsByDate getWorkstations;

  WorkstationBloc({@required GetWorkstationsByDate getWorkstations})
      : assert(getWorkstations != null),
        getWorkstations = getWorkstations,
        super(WorkstationInitial());

  @override
  Stream<WorkstationState> mapEventToState(
    WorkstationEvent event,
  ) async* {
    if (event is FetchWorkstationsLists) {
      yield WorkstationsFetchLoadingState();
      print('fetching workstations');
      final tempDate = DateTime.parse("2020-03-09");
      final workstationsList = await getWorkstations(tempDate);
      yield workstationsList.fold((failure) {
        print(
            'workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
        return WorkstationsFetchErrorState();
      }, (workstations) {
        print('workstations : ${workstations.toList()}');
        return WorkstationsFetchCompletedState(workstations);
      });
    }
  }
}
