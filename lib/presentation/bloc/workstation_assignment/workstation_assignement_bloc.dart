import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/usecases/get_all_user_presences_to_end_of_month.dart';

part 'workstation_assignement_event.dart';

part 'workstation_assignement_state.dart';

class WorkstationAssignementBloc
    extends Bloc<WorkstationAssignmentEvent, WorkstationAssignementState> {
  final GetAllUserPresencesToEndOfMonth _getAllUserPresencesToEndOfMonth;

  WorkstationAssignementBloc({
    @required GetAllUserPresencesToEndOfMonth getAllUserPresencesToEndOfMonth,
  })  : _getAllUserPresencesToEndOfMonth = getAllUserPresencesToEndOfMonth,
        assert(getAllUserPresencesToEndOfMonth != null),
        super(WorkstationAssignementInitial());

  @override
  Stream<WorkstationAssignementState> mapEventToState(
    WorkstationAssignmentEvent event,
  ) async* {
    if (event is OnUserPresencesToEndOfMonthRequest) {
      yield* _fetchUserPresencesToEndOfMonth(
          event.presencesToEndOfMonthParameters);
    }
  }

  Stream<WorkstationAssignementState> _fetchUserPresencesToEndOfMonth(
      PresencesToEndOfMonthParameters presencesToEndOfMonthParameters) async* {
    yield PresencesToEndOfMonthLoadingState();
    final userPresencesToEndOfMonthResult =
        await _getAllUserPresencesToEndOfMonth(presencesToEndOfMonthParameters);
    yield userPresencesToEndOfMonthResult.fold(
      (failure) {
        print(failure.getErrorMessageFromFailure());
        return PresencesToEndOfMonthErrorState();
      },
      (result) {
        print(result.toString());
        return PresencesToEndOfMonthCompleteState(result);
      },
    );
  }
}
