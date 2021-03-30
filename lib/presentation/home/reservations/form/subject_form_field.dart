import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';

class SubjectFormField extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationFormBloc, ReservationFormState>(
      listenWhen: (previous, current) =>
          previous.reservationForm.subjectForm !=
          current.reservationForm.subjectForm,
      listener: (context, state) => controller.value = controller.value
          .copyWith(text: state.reservationForm.subjectForm.value),
      buildWhen: (previous, current) =>
          previous.reservationForm.subjectForm !=
          current.reservationForm.subjectForm,
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: 'Oggetto prenotazione*',
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
