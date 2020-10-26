import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';

enum TimePickerType { startPicker, endPicker }

class ReservationFormPage extends StatefulWidget {
  final DateTime reservationDate;
  final int idRoom;
  final Reservation reservation;

  const ReservationFormPage({
    this.reservationDate,
    this.idRoom,
    this.reservation,
  });

  @override
  _ReservationFormPageState createState() => _ReservationFormPageState();
}

class _ReservationFormPageState extends State<ReservationFormPage> {
  TextEditingController _subjectTextController = TextEditingController();
  TextEditingController _participantsTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ReservationsBloc _reservationBloc;

  TimeOfDay _reservationStartTime;
  TimeOfDay _reservationEndTime;
  List<String> _participants;
  int _idRoom;

  @override
  void initState() {
    _initTimePickers();
    _participants =
        widget.reservation != null ? widget.reservation.participants : [];
    _reservationBloc = BlocProvider.of<ReservationsBloc>(context);
    _subjectTextController.text = widget.reservation?.description;
    _idRoom =
        widget.reservation != null ? widget.reservation.idRoom : widget.idRoom;
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildDateSection(),
            ..._buildReferentSection(),
            ..._buildSubjectSection(),
            _buildTimePickersSection(),
            ..._buildParticipantsSection(),
            BlocBuilder(
                cubit: _reservationBloc,
                builder: (context, state) {
                  if (state is ReservationUpdatingState) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return _buildButtonsSection();
                  }
                }),
            BlocListener<ReservationsBloc, ReservationState>(
                child: Container(),
                cubit: _reservationBloc,
                listener: (context, state) {
                  if (state is ReservationUpdateErrorState) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)),
                    );
                  } else if (state is ReservationsFetchCompletedState) {
                    Navigator.of(context).pop();
                  }
                })
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
          widget.reservation != null
              ? 'Modifica prenotazione per il giorno:'
              : 'Nuova prenotazione per il giorno:',
          style: reservationLabelStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          widget.reservation != null
              ? '${DateFormat('EEEE, MMM d, ' 'yy').format(widget.reservation.reservationDate)}'
              : '${DateFormat('EEEE, MMM d, ' 'yy').format(widget.reservationDate)}',
          style: TextStyle(fontSize: 16),
        ),
      )
    ];
  }

  List<Widget> _buildReferentSection() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text('Referente', style: reservationLabelStyle),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          widget.reservation != null
              ? widget.reservation.idHandler.toString()
              : '276',
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
          validator: (value) =>
              value.trim().isEmpty ? "Campo obbligatorio" : null,
          maxLines: 1,
          autofocus: false,
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            hintText: "Oggetto",
            errorStyle: TextStyle(),
          ),
        ),
      )
    ];
  }

  Widget _buildTimePickersSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildReservationTimePicker(
              TimePickerType.startPicker, _reservationStartTime),
          _buildReservationTimePicker(
              TimePickerType.endPicker, _reservationEndTime)
        ],
      ),
    );
  }

  Widget _buildReservationTimePicker(
      TimePickerType pickerType, TimeOfDay time) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(
              pickerType == TimePickerType.startPicker
                  ? "Ora inizio"
                  : "Ora fine",
              style: reservationLabelStyle),
        ),
        FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: dncBlue)),
            onPressed: () async {
              FocusScope.of(context).unfocus();
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
                    pickerType == TimePickerType.startPicker
                        ? _reservationStartTime = selectedTime
                        : _reservationEndTime = selectedTime;
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
      autofocus: false,
      autofillHints: _participants,
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
                  _participants.add(_participantsTextController.text);
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
          for (var name in _participants ?? [])
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
                    _participants.remove(name);
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Row(
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
          onPressed: () => widget.reservation != null
              ? _updateReservation()
              : _insertNewReservation(),
        ),
      ],
    );
  }

  _initTimePickers() {
    _reservationStartTime = TimeOfDay.now();
    _reservationStartTime = widget.reservation != null
        ?
        //values from existing reservations
        _reservationStartTime.replacing(
            hour: widget.reservation.startHour,
            minute: widget.reservation.startMinutes)
        :
        //current hour +1
        _reservationStartTime.replacing(
            hour: _reservationStartTime.hour + 1, minute: 0);

    _reservationEndTime = TimeOfDay.now();
    _reservationEndTime = widget.reservation != null
        ?
        //values from existing reservations
        _reservationEndTime.replacing(
            hour: widget.reservation.endHour,
            minute: widget.reservation.endMinutes)
        :
        //start hour +1
        _reservationStartTime.replacing(
            hour: _reservationStartTime.hour + 1, minute: 0);
  }

  _insertNewReservation() {
    if (_formKey.currentState.validate()) {
      _reservationBloc.add(
        InsertReservationEvent(
          reservation: Reservation(
              idReservation: null,
              reservationDate: widget.reservationDate,
              description: _subjectTextController.text.trim(),
              participants: _participants,
              idHandler: 276,
              idRoom: widget.idRoom,
              freeHandler: null,
              startMinutes: _reservationStartTime.minute,
              startHour: _reservationStartTime.hour,
              endHour: _reservationEndTime.hour,
              endMinutes: _reservationEndTime.minute,
              status: RESERVATION_PENDING),
        ),
      );
    }
  }

  _updateReservation() {
    if (_formKey.currentState.validate()) {
      _reservationBloc.add(
        UpdateReservationEvent(
          updatedReservation: Reservation(
              idReservation: widget.reservation.idReservation,
              reservationDate: widget.reservation.reservationDate,
              description: _subjectTextController.text.trim().capitalize(),
              participants: _participants,
              idHandler: 276,
              idRoom: _idRoom,
              freeHandler: widget.reservation?.freeHandler,
              startMinutes: _reservationStartTime.minute,
              startHour: _reservationStartTime.hour,
              endHour: _reservationEndTime.hour,
              endMinutes: _reservationEndTime.minute,
              status: RESERVATION_PENDING),
        ),
      );
    }
  }
}
