import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/blocs/reservation/actor/reservation_actor_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/home/reservations/form/date_picker_form_field.dart';
import 'package:where_am_i/presentation/home/reservations/form/id_room_dropdown.dart';
import 'package:where_am_i/presentation/home/reservations/form/participants_form_field.dart';
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
    return BlocListener<ReservationActorBloc, ReservationActorState>(
      listener: (context, state) {
        state.maybeMap(
          updateSuccess: (_) => Navigator.of(context).pop(),
          insertSuccess: (_) => Navigator.of(context).pop(),
          orElse: () {},
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: BlocBuilder<ReservationFormBloc, ReservationFormState>(
            buildWhen: (p, c) => p.isEditing != c.isEditing,
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
                SizedBox(height: 8),
                Text(
                  authenticatedUser.getSurnameAndName(),
                  style: reservationFormTextStyle,
                ),
                // Room dropdown
                if (state.isEditing && authenticatedUser.isStaffOrAdmin())
                  IdRoomDropdown(),
                // Subject section
                SizedBox(height: 16),
                Text('Oggetto prenotazione*', style: reservationLabelStyle),
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
                BlocBuilder<ReservationFormBloc, ReservationFormState>(
                    buildWhen: (previous, current) =>
                        previous.isSaving != current.isSaving,
                    builder: (context, state) => state.isSaving
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CenteredLoading(height: 40)])
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
                                    .add(ReservationFormEvent.saveSubmitted()),
                              ),
                              SizedBox(width: 8.0),
                            ],
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    context.read<ReservationFormBloc>().close();
    super.dispose();
  }
}
