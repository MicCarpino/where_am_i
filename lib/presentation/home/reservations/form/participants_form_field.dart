import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/injection_container.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';

//the widget for the "participants" field in the reservation form
class ParticipantsFormField extends StatefulWidget {
  @override
  _ParticipantsFormFieldState createState() => _ParticipantsFormFieldState();
}

class _ParticipantsFormFieldState extends State<ParticipantsFormField> {
  final participantsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationFormBloc, ReservationFormState>(
        builder: (context, state) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Partecipanti', style: reservationLabelStyle),
                _buildAddParticipantsTextField(context),
                SizedBox(height: 8),
                //participants "chips"
                Wrap(
                  children: state.reservationForm.participants
                      .map((e) => _buildParticipantChip(context, e))
                      .toList(),
                ),
              ],
            ));
  }

  Widget _buildAddParticipantsTextField(BuildContext context) {
    return BlocConsumer<ReservationFormBloc, ReservationFormState>(
      //rebuild this widget just when the participants list change
      buildWhen: (p, c) =>
          p.reservationForm.participants != c.reservationForm.participants,
      listenWhen: (p, c) =>
          p.reservationForm.participants != c.reservationForm.participants,
      listener: (context, state) {
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() => participantsController.clear());
      },
      //this widget show suggestions in a dropdown, filtered while the user types
      builder: (context, state) => TypeAheadField(
        getImmediateSuggestions: false,
        hideOnEmpty: true,
        autoFlipDirection: true,
        textFieldConfiguration: TextFieldConfiguration(
            controller: participantsController,
            autofocus: false,
            onChanged: (value) => setState(() => participantsController.value =
                participantsController.value.copyWith(text: value)),
            //delete icon, clears the textfield
            decoration: InputDecoration(
                prefixIcon: participantsController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.black),
                        onPressed: () =>
                            setState(() => participantsController.clear()),
                      )
                    : null,
                hintText: "Aggiungi partecipante",
                //add icon, add participant chip with current typed text if pressed
                suffixIcon: participantsController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () => context
                            .read<ReservationFormBloc>()
                            .add(ReservationFormEvent.participantsChanged(
                              List<String>.of(context
                                  .read<ReservationFormBloc>()
                                  .state
                                  .reservationForm
                                  .participants)
                                ..add(participantsController.text),
                            )),
                        icon: Icon(Icons.person_add_rounded, color: dncBlue),
                      )
                    : null)),
        //the function to retrieve the users list for the dropdown
        suggestionsCallback: (pattern) async {
          final usersOrFailure = await getIt<UserRepository>().getAllUsers();
          return usersOrFailure.fold(
              (l) => null,
              (r) => r
                  .where((user) => pattern.split(" ").every((element) =>
                      user.name.containsCaseInsensitive(element) ||
                      user.surname.containsCaseInsensitive(element)))
                  .toList()
                    ..sort((a, b) => b.surname.compareTo(a.surname)));
        },
        //builder for the elements in the dropdown
        itemBuilder: (context, User suggestion) =>
            new ListTile(title: new Text(suggestion.getSurnameAndName())),
        //when an element in the dropdown is chosen update the bloc state
        onSuggestionSelected: (User suggestion) {
          context
              .read<ReservationFormBloc>()
              .add(ReservationFormEvent.participantsChanged(
                List<String>.of(context
                    .read<ReservationFormBloc>()
                    .state
                    .reservationForm
                    .participants)
                  ..add(suggestion.getSurnameAndName()),
              ));
        },
      ),
    );
  }

  //for each participants a "chip" is shown below the input field
  //the x on the chip remove the participants when pressed
  Padding _buildParticipantChip(BuildContext context, String participant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(participant),
        deleteIcon: Icon(Icons.cancel, color: Colors.black54, size: 20),
        onDeleted: () => context
            .read<ReservationFormBloc>()
            .add(ReservationFormEvent.participantsChanged(
              List<String>.of(context
                  .read<ReservationFormBloc>()
                  .state
                  .reservationForm
                  .participants)
                ..remove(participant),
            )),
      ),
    );
  }
}
