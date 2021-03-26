part of 'reservation_form_bloc.dart';

@freezed
abstract class ReservationFormEvent with _$ReservationFormEvent {
  const factory ReservationFormEvent.initializeEmpty(
    int idRoom,
    DateTime date,
    int idHandler,
  ) = _InitializeEmpty;

  const factory ReservationFormEvent.initializeEdit(Reservation reservation) =
      _InitializeEdit;

  const factory ReservationFormEvent.idRoomChanged(int idRoom) = _IdRoomChanged;

  const factory ReservationFormEvent.startTimeChanged(TimeOfDay startTime) =
      _StartTimeChanged;

  const factory ReservationFormEvent.endTimeChanged(TimeOfDay endTime) =
      _EndTimeChanged;

  const factory ReservationFormEvent.descriptionChanged(String description) =
      _DescriptionChanged;

  const factory ReservationFormEvent.participantsChanged(
      List<String> participants) = _ParticipantsChanged;

  const factory ReservationFormEvent.saved() = _Saved;
}
