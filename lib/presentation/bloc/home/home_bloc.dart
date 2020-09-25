import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_workstations.dart';
import 'package:where_am_i/domain/usecases/perform_log_out.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PerformLogOut performLogOut;
  final GetWorkstations getWorkstations;

  HomeBloc(
      {@required PerformLogOut performLogOut,
      @required GetWorkstations getWorkstations})
      : assert(performLogOut != null),
        assert(getWorkstations != null),
        performLogOut = performLogOut,
        getWorkstations = getWorkstations,
        super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchLists) {
      yield HomeLoadingState();
      print('fetching');
      final workstationsList = await getWorkstations.homeRepository
          .getWorkstations(DateTime.parse("2020-03-09"));
      yield workstationsList.fold((failure) => ListsFetchErrorState(),
          (workstationsList) => ListsFetchCompletedState(workstationsList));
    }
    if (event is OnLogoutButtonClick) {
      yield HomeLoadingState();
      final logoutResult =
          await performLogOut.loginRepository.removeLoggedUser();
      yield logoutResult.fold((failure) {
        //TODO: shows error message returned from server
        /*if (failure is ServerFailure) {
          return FailureState(error: failure.errorMessage);
        }*/
        return HomeErrorState(errorMessage: 'Log out unsuccessful');
      }, (success) => LoggedOutState());
    }
  }
}
