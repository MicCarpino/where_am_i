import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:where_am_i/domain/usecases/perform_log_out.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PerformLogOut performLogOut;

  HomeBloc({@required PerformLogOut performLogOut})
      : assert(performLogOut != null),
        performLogOut = performLogOut,
        super(HomeInitialState());

  //Controller is private - you do not want to expose it
  final StreamController<DateTime> _homeController = StreamController<DateTime>();
  //Instead, you expose a stream
  Stream<DateTime> get visualizedDate => _homeController.stream;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
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
    } else if(event is OnDateSelected){
      _homeController.sink.add(event.date);
    }
  }

  @override
  Future<Function> close() {
    _homeController.close();
    return super.close();
  }

}
