part of 'reservation_form_bloc.dart';

@freezed
abstract class ReservationFormState with _$ReservationFormState {
  const factory ReservationFormState({
    @required ReservationForm reservationForm,
    @required bool isEditing,
    @required bool isSaving,
  }) = _ReservationFormState;
}
