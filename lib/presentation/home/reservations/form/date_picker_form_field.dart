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
    return Expanded(
      child: BlocBuilder<ReservationFormBloc, ReservationFormState>(
        builder: (context, state) {
          var pickerState = timePicker == ReservationTimePicker.startPicker
              ? state.reservationForm.startTimeForm
              : state.reservationForm.endTimeForm;
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(timePicker.title,
                      style: pickerState.valid
                          ? reservationLabelStyle
                          : reservationLabelStyle.copyWith(color: Colors.red)),
                ),
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
