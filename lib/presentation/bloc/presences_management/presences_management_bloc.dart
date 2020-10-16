import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/delete_workstation.dart';
import 'package:where_am_i/domain/usecases/get_all_users_presences_by_date.dart';
import 'package:where_am_i/domain/usecases/insert_workstation.dart';

part 'presences_management_event.dart';

part 'presences_management_state.dart';

class PresencesManagementBloc
    extends Bloc<PresencesManagementEvent, PresencesManagementState> {
  final GetAllUserPresencesByDate getAllUserPresencesByDate;
  final InsertWorkstation insertWorkstation;
  final DeleteWorkstation deleteWorkstation;

  PresencesManagementBloc({
    @required GetAllUserPresencesByDate getAllUserPresencesByDate,
    @required InsertWorkstation insertWorkstation,
    @required DeleteWorkstation deleteWorkstation,
  })  : assert(getAllUserPresencesByDate != null),
        assert(insertWorkstation != null),
        assert(deleteWorkstation != null),
        getAllUserPresencesByDate = getAllUserPresencesByDate,
        insertWorkstation = insertWorkstation,
        deleteWorkstation = deleteWorkstation,
        super(PresencesManagementInitial());

  List<UserWithWorkstation> originalUsersPresencesList = List<UserWithWorkstation>();

  @override
  Stream<PresencesManagementState> mapEventToState(
    PresencesManagementEvent event,
  ) async* {
    if (event is OnUsersPresencesFetchRequested) {
      yield* _fetchAllUsersPresences(event.dateToFetch);
    } else if (event is OnUsersPresencesFilterUpdate) {
      yield* _applyFilterToList(event.filterInput);
    } else if (event is OnInsertWorkstation) {
      yield* _insertWorkstation(event.workstation);
      //TODO: must reflect insert/delete updates
      var insertResult = await  insertWorkstation(event.workstation);
    } else if (event is OnDeleteWorkstation) {
      var deleteResult = await deleteWorkstation(event.idWorkstation);
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

  Stream<PresencesManagementState> _insertWorkstation(Workstation workstation)async* {
    var insertResult = await  insertWorkstation(workstation);
    yield insertResult.fold((failure) {
      return UserPresencesErrorState();
    }, (updatedList) {
      originalUsersPresencesList = updatedList;
      return UsersPresencesReadyState(originalUsersPresencesList);
    });
  }

  Stream<PresencesManagementState> _applyFilterToList(
      String filterInput) async* {
    if (filterInput.isEmpty) {
      yield UsersPresencesReadyState(originalUsersPresencesList);
    } else {
      var filteredList = originalUsersPresencesList
          .where((user) =>
              user.user.name.toLowerCase().contains(filterInput.toLowerCase()) ||
              user.user.surname.toLowerCase().contains(filterInput.toLowerCase()))
          .toList();
      yield UsersPresencesReadyState(filteredList);
    }
  }


}
