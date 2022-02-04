import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';

//the widget for the start/end time pickers in the reservation form
class DatePickerFormField extends StatelessWidget {
  DatePickerFormField(this.timePicker);

  final ReservationTimePicker timePicker;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ReservationFormBloc, ReservationFormState>(
        //rebuild this widget just when the start or end times change
        builder: (context, state) {
          var pickerState = timePicker == ReservationTimePicker.startPicker
              ? state.reservationForm.startTimeForm
              : state.reservationForm.endTimeForm;
          return Container(
            child: Column(
              children: [
                //label for the time picker
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(timePicker.title,
                      style: pickerState.valid
                          ? reservationLabelStyle
                          : reservationLabelStyle.copyWith(color: Colors.red)),
                ),
                //open the time picker dialog when pressed
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: pickerState.valid ? dncBlue : Colors.red,
                          width: 1.25)),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    await showTimePicker(
                        context: context,
                        initialTime: pickerState.value,
                        builder: (context, child) {
                          return Theme(data: ThemeData(), child: child);
                        }).then((selectedTime) {
                      if (selectedTime != null) {
                        context.read<ReservationFormBloc>().add(
                            timePicker == ReservationTimePicker.startPicker
                                ? ReservationFormEvent.startTimeChanged(
                                    selectedTime)
                                : ReservationFormEvent.endTimeChanged(
                                    selectedTime));
                      }
                    });
                  },
                  //show the current time value inside the picker button
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24.0),
                    child: Text(
                      pickerState.value.format(context),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                //show the error message, if present
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    pickerState.valid ? '' : 'Non valido',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
