import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/injection_container.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/home/reservations/form/date_picker_form_field.dart';
import 'package:where_am_i/presentation/home/reservations/form/subject_form_field.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';

class ReservationFormPage extends StatelessWidget {
  final dateFormatter = DateFormat('EEEE d MMMM ' 'yyyy');

  final participantsController = TextEditingController();

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
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ReservationTimePicker.values
                    .map((e) => DatePickerFormField(e))
                    .toList(),
              ),
              // Participants section
              SizedBox(height: 16),
              Text('Partecipanti', style: reservationLabelStyle),
              _buildAddParticipantsTextField(context),
              SizedBox(height: 8),
              Wrap(
                children: state.reservationForm.participants
                    .map((e) => _buildParticipantChip(context, e))
                    .toList(),
              ),
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

  Widget _buildAddParticipantsTextField(BuildContext context) {
    return BlocConsumer<ReservationFormBloc, ReservationFormState>(
      buildWhen: (p, c) =>
          p.reservationForm.participants != c.reservationForm.participants,
      listenWhen: (p, c) =>
          p.reservationForm.participants != c.reservationForm.participants,
      listener: (context, state) => participantsController.clear(),
      builder: (context, state) => TypeAheadField(
        hideOnEmpty: true,
        autoFlipDirection: true,
        textFieldConfiguration: TextFieldConfiguration(
            controller: participantsController,
            autofocus: false,
            //delete icon, clears textfield
            decoration: InputDecoration(
                prefixIcon: participantsController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.black),
                        onPressed: () => participantsController.clear(),
                      )
                    : null,
                hintText: "Aggiungi partecipante",
                //add icon, add participant chip
                suffixIcon: participantsController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person_add_rounded, color: dncBlue),
                      )
                    : null)),
        suggestionsCallback: (pattern) => pattern.isNotEmpty
            ? getIt<UserRepository>()
                .getAllUsers()
                .then((value) => value.getOrElse(() => null))
            : null,
        itemBuilder: (context, User suggestion) =>
            new ListTile(title: new Text(suggestion.getSurnameAndName())),
        onSuggestionSelected: (User suggestion) {
          context
              .read<ReservationFormBloc>()
              .add(ReservationFormEvent.participantsChanged(
                context
                    .read<ReservationFormBloc>()
                    .state
                    .reservationForm
                    .participants
                  ..add('${suggestion.getSurnameAndName()}'),
              ));
        },
      ),
    );
  }

  Padding _buildParticipantChip(BuildContext context, String participant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(participant),
        deleteIcon: Icon(Icons.cancel, color: Colors.black54, size: 20),
        onDeleted: () => context
            .read<ReservationFormBloc>()
            .add(ReservationFormEvent.participantsChanged(
              context
                  .read<ReservationFormBloc>()
                  .state
                  .reservationForm
                  .participants
                ..remove(participant),
            )),
      ),
    );
  }
}
