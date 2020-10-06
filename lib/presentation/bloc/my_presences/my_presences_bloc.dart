import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_workstations_by_id_resource.dart';
import 'package:where_am_i/domain/usecases/update_user_presences.dart';

part 'my_presences_event.dart';

part 'my_presences_state.dart';

class MyPresencesBloc extends Bloc<MyPresencesEvent, MyPresencesState> {
  final GetWorkstationsByIdResource getWorkstationsByIdResource;
  final UpdateUserPresences updateUserPresences;
  MyPresencesBloc({
    @required GetWorkstationsByIdResource getWorkstationsByIdResource,
    @required UpdateUserPresences updateUserPresences,
  })  : assert(updateUserPresences != null),
        assert(getWorkstationsByIdResource != null),
        getWorkstationsByIdResource = getWorkstationsByIdResource,
        updateUserPresences = updateUserPresences,
        super(MyPresencesInitial());

  @override
  Stream<MyPresencesState> mapEventToState(MyPresencesEvent event) async* {
    if (event is FetchCurrentUserPresences) {
      yield* _fetchCurrentUserPresences();
    } else if (event is OnCurrentUserPresencesUpdate) {
      yield* _updateUserPresences(event.updatedPresences);
    }
  }

  Stream<MyPresencesState> _fetchCurrentUserPresences() async* {
    yield CurrentUserFetchLoadingState();
    print('fetching user presences');
    final userPresences = await getWorkstationsByIdResource(NoParams());
    yield userPresences.fold((failure) {
      print(
          'user presences fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return CurrentUserPresencesFetchErrorState();
    }, (userPresences) {
      print('user presences : ${userPresences.length}');
      return CurrentUserPresencesFetchCompleted(userPresences);
    });
  }

  Stream<void> _updateUserPresences(List<DateTime> updatedPresences) async* {
    final updateResult = await updateUserPresences(updatedPresences);
    updateResult.fold((failure) {
      print(
          'update fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return CurrentUserPresencesFetchErrorState();
    }, (userPresences) {
      print('update : ${updateResult.length}');
      return CurrentUserPresencesFetchCompleted(userPresences);
    });
  }
}
