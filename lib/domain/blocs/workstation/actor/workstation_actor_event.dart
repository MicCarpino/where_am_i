part of 'workstation_actor_bloc.dart';

@freezed
abstract class WorkstationActorEvent with _$WorkstationActorEvent {
  const factory WorkstationActorEvent.update(Workstation workstation) =
      _Updated;

  const factory WorkstationActorEvent.multipleUpdates(
      List<Workstation> updatedWorkstations) = _MultipleUpdates;
}
