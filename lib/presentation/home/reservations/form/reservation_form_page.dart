import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/home/reservations/form/date_picker_form_field.dart';
import 'package:where_am_i/presentation/home/reservations/form/participants_form_field.dart';
import 'package:where_am_i/domain/blocs/reservation/actor/reservation_actor_bloc.dart';
import 'package:where_am_i/presentation/home/reservations/form/subject_form_field.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';

class ReservationFormPage extends StatefulWidget {
  @override
  _ReservationFormPageState createState() => _ReservationFormPageState();
}

class _ReservationFormPageState extends State<ReservationFormPage> {
  final dateFormatter = DateFormat('EEEE d MMMM ' 'yyyy');

  @override
  Widget build(BuildContext context) {
    User authenticatedUser = context
        .select((AuthenticationBloc auth) => auth.state.authenticatedUser.user);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: dncBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: BlocBuilder<ReservationFormBloc, ReservationFormState>(
          buildWhen: (previous, current) =>
              previous.isSaving != current.isSaving,
          builder: (context, state) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form header
              Text(
                '${state.isEditing ? 'Modifica' : 'Nuova'} prenotazione per il giorno:',
                style: reservationLabelStyle,
              ),
              SizedBox(height: 8),
              Text(
                dateFormatter.format(state.reservationForm.date),
                style: reservationFormTextStyle,
              ),
              // Referent section
              SizedBox(height: 16),
              Text('Referente', style: reservationLabelStyle),
              // Room dropdown
              SizedBox(height: 8),
              Text(
                authenticatedUser.getSurnameAndName(),
                style: reservationFormTextStyle,
              ),
              if (state.isEditing && authenticatedUser.isStaffOrAdmin())
                DropdownButton(
                  value: state.reservationForm.idRoom,
                  items: Rooms.values
                      .where((element) => element.idRoom != null)
                      .map((e) => DropdownMenuItem(
                            value: e.idRoom,
                            child: Text(e.reservationRoomTitle),
                          ))
                      .toList(),
                  onChanged: (value) => print(value.toString()),
                ),
              // Subject section
              SizedBox(height: 16),
              SubjectFormField(),
              // Date pickers
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ReservationTimePicker.values
                    .map((e) => DatePickerFormField(e))
                    .toList(),
              ),
              // Participants section
              SizedBox(height: 16),
              ParticipantsFormField(),
              // Buttons section
              SizedBox(height: 16),
              state.isSaving
                  ? CenteredLoading(width: 50, height: 50)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          color: dncBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            'ANNULLA',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        SizedBox(width: 16.0),
                        MaterialButton(
                          color: dncBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            'CONFERMA',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => context
                              .read<ReservationFormBloc>()
                              .add(ReservationFormEvent.saved()),
                        ),
                        SizedBox(width: 8.0),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
