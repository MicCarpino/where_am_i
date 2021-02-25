part of 'presences_management_actor_bloc.dart';

@freezed
abstract class PresencesManagementActorEvent
    with _$PresencesManagementActorEvent {
  const factory PresencesManagementActorEvent.added({
    @required TimeSlot timeSlot,
    @required DateTime date,
    String idResource,
    String freeName,
  }) = _Added;

  const factory PresencesManagementActorEvent.addedMultiple({
    @required TimeSlot timeSlot,
    @required List<DateTime> dates,
    String idResource,
    String freeName,
  }) = _AddedMultiple;

  const factory PresencesManagementActorEvent.removed(Workstation workstation) =
      _Removed;

  const factory PresencesManagementActorEvent.updated(Workstation workstation) =
      _Updated;

  const factory PresencesManagementActorEvent.editRequested(DateTime day,
      [Workstation workstation, User user]) = _EditRequested;
}
