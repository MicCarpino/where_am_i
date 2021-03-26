part of 'reservation_form_bloc.dart';

@freezed
abstract class ReservationFormState with _$ReservationFormState {
  const factory ReservationFormState({
    @required ReservationForm reservationForm,
    @required bool isEditing,
    @required bool isSaving,
    @required Option<Either<Failure, Unit>> saveFailureOrSuccessOption,
  }) = _ReservationFormState;

  factory ReservationFormState.initial() => ReservationFormState(
        reservationForm: ReservationForm.initial(0, DateTime.now(), 0),
        isEditing: false,
        isSaving: false,
        saveFailureOrSuccessOption: none(),
      );
}
