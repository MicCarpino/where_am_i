import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

class ReservationFormPage extends StatefulWidget {
  final DateTime reservationDate;
  final Reservation reservation;

  const ReservationFormPage({@required this.reservationDate, this.reservation});

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

  TextEditingController _reservationSubjectTextController = TextEditingController();
  TextEditingController _participantsTextController = TextEditingController();

  @override
  void initState() {
    _participantsTextController.addListener(() {
      setState(() {});
    });
    reservationStartTime = TimeOfDay.now();
    reservationEndTime = reservationStartTime.replacing(
        hour: reservationStartTime.hour + 1, minute: 0);
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
                  '${DateFormat('EEEE, MMM d, ' 'yy').format(widget.reservationDate)}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Referente',
                style: reservationLabelStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('CURRENT USER'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Oggetto prenotazione*',
                style: reservationLabelStyle,
              ),
            ),
            _buildReservationSubjectTextField(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildReservationTimePicker(
                      'Ora inizio', reservationStartTime),
                  _buildReservationTimePicker('Ora fine', reservationEndTime)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Partecipanti',
                style: reservationLabelStyle,
              ),
            ),
            _buildAddParticipantsTextField(),
            _buildParticipantsChips(),
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
                  onPressed: () => _insertReservation(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildReservationSubjectTextField() {
    return TextField(
      controller: _reservationSubjectTextController,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Oggetto",
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

  _insertReservation() {
    Navigator.pop(context);
  }

}
