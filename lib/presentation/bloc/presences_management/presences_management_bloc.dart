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
  List<User> originalUsersPresencesList = List<User>();

  PresencesManagementBloc({
    @required GetAllUserPresencesByDate getAllUserPresencesByDate,
  })  : assert(getAllUserPresencesByDate != null),
        getAllUserPresencesByDate = getAllUserPresencesByDate,
        super(PresencesManagementInitial());

  @override
  Stream<PresencesManagementState> mapEventToState(
    PresencesManagementEvent event,
  ) async* {
    if (event is OnUsersPresencesFetchRequested) {
      yield* _fetchAllUsersPresences(event.dateToFetch);
    }
    if (event is OnUsersPresencesFilterUpdate) {
      yield* _applyFilterToList(event.filterInput);
    }
  }

  Stream<PresencesManagementState> _fetchAllUsersPresences(
      DateTime date) async* {
    yield UsersPresencesLoadingState();
    print('fetching all users presences');
    final userPresences = await getAllUserPresencesByDate(date);
    yield userPresences.fold((failure) {
      print(
          'all users presences fail : ${failure is ServerFailure ? failure.errorMessage : failure.toString()}');
      return UserPresencesErrorState();
    }, (allUserPresences) {
      print('all users user presences : ${userPresences.length}');
      originalUsersPresencesList = allUserPresences;
      return UsersPresencesReadyState(allUserPresences);
    });
  }

  Stream<PresencesManagementState> _applyFilterToList(
      String filterInput) async* {
    if (filterInput.isEmpty) {
      yield UsersPresencesReadyState(originalUsersPresencesList);
    } else {
      var filteredList = originalUsersPresencesList
          .where((user) =>
              user.name.toLowerCase().contains(filterInput.toLowerCase()) ||
              user.surname.toLowerCase().contains(filterInput.toLowerCase()))
          .toList();
      yield UsersPresencesReadyState(filteredList);
    }
  }
}
