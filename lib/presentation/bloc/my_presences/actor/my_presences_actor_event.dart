part of 'my_presences_actor_bloc.dart';

@freezed
abstract class MyPresencesActorEvent with _$MyPresencesActorEvent {
  const factory MyPresencesActorEvent.added(DateTime date) = _Added;
  const factory MyPresencesActorEvent.removed(Workstation workstation) = _Removed;
  const factory MyPresencesActorEvent.updated(Workstation workstation) = _Updated;
  const factory MyPresencesActorEvent.editRequested(DateTime day,[Workstation workstation]) = _EditRequested;
}