import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';


//the widget for the "subject" field (mandatory) in the reservation form
class SubjectFormField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationFormBloc, ReservationFormState>(
      buildWhen: (previous, current) =>
          previous.reservationForm.subjectForm !=
          current.reservationForm.subjectForm,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.reservationForm.subjectForm.value,
          decoration: InputDecoration(
              errorText: state.reservationForm.subjectForm.invalid
                  ? 'Campo obbligatorio'
                  : null),
          onChanged: (value) => context
              .read<ReservationFormBloc>()
              .add(ReservationFormEvent.descriptionChanged(value)),
        );
      },
    );
  }
}
