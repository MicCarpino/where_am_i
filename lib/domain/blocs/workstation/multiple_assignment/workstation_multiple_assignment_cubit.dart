import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';

part 'workstation_multiple_assignment_state.dart';

part 'workstation_multiple_assignment_cubit.freezed.dart';

class WorkstationMultipleAssignmentCubit
    extends Cubit<WorkstationMultipleAssignmentState> {
  WorkstationMultipleAssignmentCubit({@required this.workstationRepository})
      : super(WorkstationMultipleAssignmentState.loadingState());

  final WorkstationRepository workstationRepository;

  fetchUserPresencesToEndOfMonth(
      String idResource, DateTime startingDate) async {
    emit(WorkstationMultipleAssignmentState.loadingState());
    String formattedDate = DateFormat('yyyy-MM-dd').format(startingDate);
    final presencesToEndOfMonthResult = await workstationRepository
        .getAllByIdResourceToEndOfMonth(idResource, formattedDate);
    emit(
      presencesToEndOfMonthResult.fold(
        (failure) => WorkstationMultipleAssignmentState.errorState(failure),
        (presences) =>
            WorkstationMultipleAssignmentState.loadedState(presences),
      ),
    );
  }
}
