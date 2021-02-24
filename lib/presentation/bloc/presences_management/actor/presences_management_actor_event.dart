part of 'presences_management_actor_bloc.dart';

@freezed
abstract class PresencesManagementActorEvent with _$PresencesManagementActorEvent {
  const factory PresencesManagementActorEvent.added(
      TimeSlot timeslot,
      DateTime date,
      ) = _Added;

  const factory PresencesManagementActorEvent.addedMultiple(
      TimeSlot timeslot,
      List<DateTime> dates,
      ) = _AddedMultiple;

  const factory PresencesManagementActorEvent.removed(Workstation workstation) =
  _Removed;

  const factory PresencesManagementActorEvent.updated(Workstation workstation) =
  _Updated;

  const factory PresencesManagementActorEvent.editRequested(DateTime day,
      [Workstation workstation]) = _EditRequested;
}
