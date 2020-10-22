import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';

class ReservationFormPage extends StatefulWidget {
  final DateTime reservationDate;
  final int idRoom;
  final Reservation reservation;

  const ReservationFormPage({
    @required this.reservationDate,
    @required this.idRoom,
    this.reservation,
  });

  @override
  _ReservationFormPageState createState() => _ReservationFormPageState();
}

class _ReservationFormPageState extends State<ReservationFormPage> {
  TimeOfDay reservationStartTime;
  TimeOfDay reservationEndTime;

  List<String> participants = [
    "Gianni",
    "Sasa",
    "Giansasa",
    "Giangiangiangelo",
    "GianmariaMatteo",
    "Pierugo",
  ];

  TextEditingController _subjectTextController = TextEditingController();
  TextEditingController _participantsTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ReservationsBloc _reservationBloc;

  @override
  void initState() {
    _initTimePickers();
    _reservationBloc = BlocProvider.of<ReservationsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dncBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildDateSection(),
            ..._buildReferentSection(),
            ..._buildSubjectSection(),
            _buildDatePickers(),
            ..._buildParticipantsSection(),
            ..._buildButtonsSection()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDateSection() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          'Nuova prenotazione per il giorno:',
          style: reservationLabelStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          '${DateFormat('EEEE, MMM d, ' 'yy').format(widget.reservationDate)}',
          style: TextStyle(fontSize: 16),
        ),
      )
    ];
  }

  List<Widget> _buildReferentSection() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          'Referente',
          style: reservationLabelStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          'CURRENT USER',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ];
  }

  List<Widget> _buildSubjectSection() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          'Oggetto prenotazione*',
          style: reservationLabelStyle,
        ),
      ),
      Form(
        key: _formKey,
        child: TextFormField(
          controller: _subjectTextController,
          validator: (value) => value.trim().isEmpty ? "Campo obbligatorio" : null,
          maxLines: 1,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: "Oggetto",
            errorStyle: TextStyle(),
          ),
        ),
      )
    ];
  }

  Widget _buildDatePickers() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildReservationTimePicker('Ora inizio', reservationStartTime),
          _buildReservationTimePicker('Ora fine', reservationEndTime)
        ],
      ),
    );
  }

  Widget _buildReservationTimePicker(String label, TimeOfDay time) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(label, style: reservationLabelStyle),
        ),
        FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: dncBlue)),
            onPressed: () async {
              await showTimePicker(
                  context: context,
                  initialTime: time,
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(),
                      child: child,
                    );
                  }).then((selectedTime) {
                if (selectedTime != null) {
                  setState(() {
                    reservationStartTime = selectedTime;
                  });
                }
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 24.0),
              child: Text(
                time.format(context),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )),
      ],
    );
  }

  List<Widget> _buildParticipantsSection() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text('Partecipanti', style: reservationLabelStyle),
      ),
      _buildAddParticipantsTextField(),
      _buildParticipantsChips(),
    ];
  }

  Widget _buildAddParticipantsTextField() {
    return TextField(
      autofillHints: participants,
      controller: _participantsTextController,
      maxLines: 1,
      decoration: InputDecoration(
        //delete icon, clears textfield
        prefixIcon: _participantsTextController.text.isNotEmpty
            ? IconButton(
                onPressed: () => _participantsTextController.clear(),
                icon: Icon(Icons.clear, color: Colors.black),
              )
            : null,
        hintText: "Aggiungi partecipante",
        //add icon, add participant chip
        suffixIcon: _participantsTextController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  participants.add(_participantsTextController.text);
                  _participantsTextController.clear();
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(Icons.person_add_rounded, color: dncBlue),
              )
            : null,
      ),
    );
  }

  Widget _buildParticipantsChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        children: [
          for (var name in participants)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chip(
                label: Text(name),
                deleteIcon: Icon(
                  Icons.cancel,
                  color: Colors.black54,
                  size: 20,
                ),
                onDeleted: () {
                  setState(() {
                    participants.remove(name);
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildButtonsSection() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            color: dncBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: dncBlue)),
            child: Text(
              'Annulla'.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          SizedBox(width: 16),
          MaterialButton(
            color: dncBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: dncBlue)),
            child: Text(
              'Conferma'.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => _validateReservation(),
          ),
        ],
      )
    ];
  }

  _initTimePickers() {
    reservationStartTime = TimeOfDay.now();
    reservationStartTime = reservationStartTime.replacing(
        hour: reservationStartTime.hour + 1, minute: 0);
    if (reservationStartTime.hour == 13) {
      reservationStartTime = reservationStartTime.replacing(hour: 14);
    }
    reservationEndTime = reservationStartTime.replacing(
        hour: reservationStartTime.hour + 1, minute: 0);
  }

  _validateReservation() {
    if (_formKey.currentState.validate()) {
      Reservation newReservation = Reservation(
          idReservation: null,
          reservationDate: widget.reservationDate,
          description: _subjectTextController.text.trim(),
          participants: participants,
          idHandler: 276,
          idRoom: widget.idRoom,
          freeHandler: null,
          startMinutes: reservationStartTime.minute,
          startHour: reservationStartTime.hour,
          endHour: reservationEndTime.hour,
          endMinutes: reservationEndTime.minute,
          status: RESERVATION_PENDING);
      _reservationBloc.add(InsertReservation(reservation: newReservation));
    //  Navigator.pop(context);
    }
    //_reservationBloc.add(InsertReservation(reservation: newReservation));
  }
}
