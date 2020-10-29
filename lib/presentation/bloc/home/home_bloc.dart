import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/usecases/usecase.dart';

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
  final StreamController<DateTime> _homeController =
      StreamController<DateTime>.broadcast();

  //Instead, you expose a stream
  Stream<DateTime> get visualizedDateStream => _homeController.stream;

  DateTime visualizedDate = DateTime.now();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnLogoutButtonClick) {
      yield HomeLoadingState();
      final logoutResult =
          await performLogOut(NoParams());
      yield logoutResult.fold((failure) {
        //TODO: shows error message returned from server
        /*if (failure is ServerFailure) {
          return FailureState(error: failure.errorMessage);
        }*/
        return HomeErrorState(errorMessage: 'Log out unsuccessful');
      }, (success) => LoggedOutState());
    }
  }

  @override
  Future<Function> close() {
    _homeController.close();
    return super.close();
  }
}
