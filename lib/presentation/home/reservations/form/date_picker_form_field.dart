import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';

class DatePickerFormField extends StatelessWidget {
  DatePickerFormField(this.timePicker);

  final ReservationTimePicker timePicker;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationFormBloc, ReservationFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: Text(timePicker.title, style: reservationLabelStyle),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: dncBlue,width: 1.25)),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                await showTimePicker(
                    context: context,
                    initialTime: timePicker == ReservationTimePicker.startPicker
                        ? state.reservationForm.startTimeForm.value
                        : state.reservationForm.endTimeForm.value,
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(),
                        child: child,
                      );
                    }).then((selectedTime) {
                  if (selectedTime != null) {
                    context.read<ReservationFormBloc>().add(timePicker ==
                            ReservationTimePicker.startPicker
                        ? ReservationFormEvent.startTimeChanged(selectedTime)
                        : ReservationFormEvent.endTimeChanged(selectedTime));
                  }
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24.0),
                child: Text(
                  timePicker == ReservationTimePicker.startPicker
                      ? state.reservationForm.startTimeForm.value
                          .format(context)
                      : state.reservationForm.endTimeForm.value.format(context),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
