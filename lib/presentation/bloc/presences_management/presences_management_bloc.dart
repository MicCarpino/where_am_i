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
  List<User> originalUsersList = List<User>();

  PresencesManagementBloc({
    @required GetAllUserPresencesByDate getAllUserPresencesByDate,
  })  : assert(getAllUserPresencesByDate != null),
        getAllUserPresencesByDate = getAllUserPresencesByDate,
        super(PresencesManagementInitial());

  @override
  Stream<PresencesManagementState> mapEventToState(
    PresencesManagementEvent event,
  ) async* {
    if (event is FilterUsersPresences) {
      yield* _applyFilterToList(event.filterInput);
    }
    if (event is FetchAllUserPresences) {
      yield* _fetchAllUsersPresences(event.dateToFetch);
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
      originalUsersList = allUserPresences;
      return UsersPresencesReadyState(allUserPresences);
    });
  }

  Stream<PresencesManagementState> _applyFilterToList(
      String filterInput) async* {
    if (filterInput.isEmpty) {
      yield UsersPresencesReadyState(originalUsersList);
    } else {
      var filteredList = originalUsersList
          .where((user) =>
              user.name.toLowerCase().contains(filterInput.toLowerCase()) ||
              user.surname.toLowerCase().contains(filterInput.toLowerCase()))
          .toList();
      yield UsersPresencesReadyState(filteredList);
    }
  }
}
