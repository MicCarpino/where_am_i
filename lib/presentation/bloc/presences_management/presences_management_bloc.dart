import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_all_users_presences_by_date.dart';

part 'presences_management_event.dart';

part 'presences_management_state.dart';

class PresencesManagementBloc
    extends Bloc<PresencesManagementEvent, PresencesManagementState> {
  final GetAllUserPresencesByDate getAllUserPresencesByDate;

  PresencesManagementBloc({
    @required GetAllUserPresencesByDate getAllUserPresencesByDate,
  })  : assert(getAllUserPresencesByDate != null),
        getAllUserPresencesByDate = getAllUserPresencesByDate,
        super(PresencesManagementInitial());

  @override
  Stream<PresencesManagementState> mapEventToState(
    PresencesManagementEvent event,
  ) async* {
    if (event is FetchAllUserPresences) {
      yield* _fetchAllUsersPresences(event.dateToFetch);
    }
  }

  Stream<PresencesManagementState> _fetchAllUsersPresences(
      DateTime date) async* {
    yield UsersPresencesFetchLoadingState();
    print('fetching all users presences');
    final userPresences = await getAllUserPresencesByDate(date);
    yield userPresences.fold((failure) {
      print(
          'all users presences fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return UserPresencesFetchErrorState();
    }, (allUserPresences) {
      print('all users user presences : ${userPresences.length}');
      return AllUsersPresencesFetchCompleted(allUserPresences);
    });
  }
}
