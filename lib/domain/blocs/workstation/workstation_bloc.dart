import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/data/user_service.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_date.dart';
import 'package:where_am_i/domain/usecases/workstations/update_all_workstations.dart';
import 'package:where_am_i/domain/usecases/workstations/update_workstation.dart';

part 'workstation_event.dart';

part 'workstation_state.dart';

class WorkstationBloc extends Bloc<WorkstationEvent, WorkstationState> {
  final GetWorkstationsByDate getWorkstationsByDate;
  final UpdateWorkstation _updateWorkstation;
  final UpdateAllWorkstations _updateAllWorkstations;
  final UserService _userService;

  WorkstationBloc({
    @required GetWorkstationsByDate getWorkstationsByDate,
    @required UpdateWorkstation updateWorkstation,
    @required UpdateAllWorkstations updateAllWorkstations,
    @required UserService userService,
  })  : assert(getWorkstationsByDate != null),
        assert(updateWorkstation != null),
        assert(updateAllWorkstations != null),
        assert(userService != null),
        getWorkstationsByDate = getWorkstationsByDate,
        _updateWorkstation = updateWorkstation,
        _updateAllWorkstations = updateAllWorkstations,
        _userService = userService,
        super(WorkstationInitial());

  List<UserWithWorkstation> currentWorkstationList =
      List<UserWithWorkstation>();

  @override
  Stream<WorkstationState> mapEventToState(WorkstationEvent event) async* {
    if (event is FetchWorkstationsLists) {
      yield* _fetchWorkstationsList(event.dateToFetch);
    } else if (event is OnSingleWorkstationUpdate) {
      yield* _performWorkstationUpdate(event.workstation);
    } else if (event is OnMultipleWorkstationsUpdate) {
      yield* _performMultipleWorkstationsUpdate(event.updatedWorkstations);
    }
  }

  Stream<WorkstationState> _fetchWorkstationsList(DateTime dateToFetch) async* {
    yield WorkstationsFetchLoadingState();
    print('fetching workstations for $dateToFetch');
    final workstationsList = await getWorkstationsByDate(dateToFetch);
    yield workstationsList.fold((failure) {
      print('workstations fail');
      return WorkstationsFetchErrorState();
    }, (workstations) {
      //saving last fetch result to perform update without needing to download a new list
      currentWorkstationList = workstations;
      //retrieving user's workstation code for current day
      if (dateToFetch.isAtSameMomentTimeLess(DateTime.now())) {
        _searchForCurrentUserWorkstation(workstations);
      }
      print('workstations : ${workstations.toList()}');
      return WorkstationsFetchCompletedState(workstations);
    });
  }

  _searchForCurrentUserWorkstation(List<UserWithWorkstation> workstations) {
    UserWithWorkstation workstationForCurrentDay = workstations.singleWhere(
        (element) =>
            element.workstation.idResource ==
            _userService.loggedUser.idResource,
        orElse: () => null);
    if (workstationForCurrentDay?.workstation?.codeWorkstation != null) {
      int workstationCodeForCurrentDay =
          int.tryParse(workstationForCurrentDay.workstation.codeWorkstation);
      _userService.setAssignedWorkstationCode(workstationCodeForCurrentDay);
    }
  }

  Stream<WorkstationState> _performWorkstationUpdate(
      Workstation updatedWorkstation) async* {
    yield WorkstationUpdatingState();
    final updateWorkstationResult =
        await _updateWorkstation(updatedWorkstation);
    yield updateWorkstationResult.fold(
        (failure) => WorkstationUpdateErrorState(
            errorMessage: failure.getErrorMessageFromFailure()), (result) {
      int indexToUpdate = currentWorkstationList.indexWhere((element) =>
          element.workstation.idWorkstation == result.idWorkstation);
      if (indexToUpdate != -1) {
        currentWorkstationList[indexToUpdate] = UserWithWorkstation(
            user: currentWorkstationList[indexToUpdate].user,
            workstation: result);
      }
      return WorkstationsFetchCompletedState(currentWorkstationList);
    });
  }

  Stream<WorkstationState> _performMultipleWorkstationsUpdate(
      List<Workstation> updatedWorkstations) async* {
    yield WorkstationUpdatingState();
    yield WorkstationUpdateStatusChanged(isLoading: true);
    final updateMultipleWorkstationsResult =
        await _updateAllWorkstations(updatedWorkstations);
    yield updateMultipleWorkstationsResult.fold(
        (failure) => WorkstationUpdateErrorState(
            errorMessage: failure.getErrorMessageFromFailure()), (r) {
      List<Workstation> updatedWorkstations = updateMultipleWorkstationsResult
          .foldRight(null, (workstations, previous) => workstations);
      var workstationForCurrentDateUpdated = updatedWorkstations.singleWhere(
          (a) => currentWorkstationList
              .any((b) => a.idWorkstation == b.workstation.idWorkstation),
          orElse: () => null);
      //searching updated workstation for visualized date
      var indexToUpdate = currentWorkstationList.indexWhere((element) =>
          element.workstation.idWorkstation ==
          workstationForCurrentDateUpdated?.idWorkstation);
      //updating local list if an occurrence is found
      if (indexToUpdate != -1) {
        currentWorkstationList[indexToUpdate] = UserWithWorkstation(
            user: currentWorkstationList[indexToUpdate].user,
            workstation: workstationForCurrentDateUpdated);
      }
      return WorkstationUpdateStatusChanged(isLoading: false);
    });
    yield WorkstationsFetchCompletedState(currentWorkstationList);
  }
}

/*
     //this snippet could be used to perform workstation assignment/replacement
     //
     //check if someone was already assigned to the workstation
      int indexOfCurrentUserAssigned = currentWorkstationList.indexWhere(
          (element) =>
              element.workstation.codeWorkstation ==
              updatedWorkstation.codeWorkstation);
      _userService.setAssignedWorkstationCode(indexOfCurrentUserAssigned);
      //if there's a result means it has been replaced so his workstationCode is cleared
      if (indexOfCurrentUserAssigned != -1) {
        var currentUser = currentWorkstationList[indexOfCurrentUserAssigned];
        //clearing codeWorkstation of current user assigned
        currentWorkstationList[indexOfCurrentUserAssigned] =
            UserWithWorkstation(
                user: currentUser.user,
                workstation: currentUser.workstation.assignWorkstationCode(null));
      }*/
//updating new user assigned to workstation
