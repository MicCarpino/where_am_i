import 'dart:async';
import 'package:meta/meta.dart';

import 'package:bloc/bloc.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_date.dart';
import 'package:where_am_i/domain/usecases/update_workstation.dart';

part 'workstation_event.dart';

part 'workstation_state.dart';

class WorkstationBloc extends Bloc<WorkstationEvent, WorkstationState> {
  final GetWorkstationsByDate getWorkstationsByDate;
  final UpdateWorkstation _updateWorkstation;

  WorkstationBloc({
    @required GetWorkstationsByDate getWorkstationsByDate,
    @required UpdateWorkstation updateWorkstation,
  })  : assert(getWorkstationsByDate != null),
        assert(updateWorkstation != null),
        getWorkstationsByDate = getWorkstationsByDate,
        _updateWorkstation = updateWorkstation,
        super(WorkstationInitial());
  List<UserWithWorkstation> currentWorkstationList =
      List<UserWithWorkstation>();

  @override
  Stream<WorkstationState> mapEventToState(
    WorkstationEvent event,
  ) async* {
    if (event is FetchWorkstationsLists) {
      yield* _fetchWorkstationsList(event.dateToFetch);
    } else if (event is OnWorkstationUpdate) {
      yield* _performWorkstationUpdate(event.workstation);
    }
  }

  Stream<WorkstationState> _fetchWorkstationsList(DateTime dateToFetch) async* {
    yield WorkstationsFetchLoadingState();
    print('fetching workstations for $dateToFetch');
    final workstationsList = await getWorkstationsByDate(dateToFetch);
    yield workstationsList.fold((failure) {
      print('workstations fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return WorkstationsFetchErrorState();
    }, (workstations) {
      //saving last fetch result to perform update without needing to download a new list
      currentWorkstationList = workstations;
      print('workstations : ${workstations.toList()}');
      return WorkstationsFetchCompletedState(workstations);
    });
  }

  Stream<WorkstationState> _performWorkstationUpdate(
      Workstation updatedWorkstation) async* {
    final updateWorkstationResult =
        await _updateWorkstation(updatedWorkstation);
    yield updateWorkstationResult.fold(
        (failure) => WorkstationsFetchCompletedState(currentWorkstationList),
        (result) {
      //check if someone were already assigned to the workstation
      int indexOfCurrentUserAssigned = currentWorkstationList.indexWhere(
          (element) =>
              element.workstation.codeWorkstation ==
              updatedWorkstation.codeWorkstation);
      //if there's a result means it has been replaced so his workstationCode is cleared
      if (indexOfCurrentUserAssigned != -1) {
        var currentUser = currentWorkstationList[indexOfCurrentUserAssigned];
        //clearing codeWorkstation of current user assigned
        currentWorkstationList[indexOfCurrentUserAssigned] =
            UserWithWorkstation(
                user: currentUser.user,
                workstation: Workstation(
                    idWorkstation: currentUser.workstation.idWorkstation,
                    freeName: currentUser.workstation.freeName,
                    idResource: currentUser.workstation.idResource,
                    codeWorkstation: null,
                    workstationDate: currentUser.workstation.workstationDate));
      }
      //updating new user assigned to workstation
      int newUser = currentWorkstationList.indexWhere((element) =>
          element.workstation.idWorkstation ==
          updatedWorkstation.idWorkstation);
      currentWorkstationList[newUser] = UserWithWorkstation(
          user: currentWorkstationList[newUser].user, workstation: result);
      return WorkstationsFetchCompletedState(currentWorkstationList);
    });
  }
}
