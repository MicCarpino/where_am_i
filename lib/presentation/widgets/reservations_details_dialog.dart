import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

class ReservationDetailsDialog extends StatelessWidget {
  final Reservation reservation;

  ReservationDetailsDialog({@required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Oggetto', style: reservationLabelStyle),
            SizedBox(height: 8),
            Text(reservation.description),
            Divider(),
            Text('Referente', style: reservationLabelStyle),
            SizedBox(height: 8),
            Text(reservation.idHandler.toString()),
            Divider(),
            Text('Orario', style: reservationLabelStyle),
            SizedBox(height: 8),
            Text(formatTime()),
            Divider(),
            Text('Partecipanti', style: reservationLabelStyle),
            SizedBox(height: 8),
            Text(reservation.participants!= null? reservation.participants.join(","):"Nessun partecipante indicato"),
          ],
        ),
      ),
    );
  }

  String formatTime() {
    return
      '${formatSingleDigitTime(reservation.startHour)}.${formatSingleDigitTime(
          reservation.startMinutes)} - ${formatSingleDigitTime(
          reservation.endHour)}.${formatSingleDigitTime(reservation
          .endMinutes)}';
  }

  String formatSingleDigitTime(int digit) {
    if (digit == 0) {
      return "00";
    } else if (digit < 10) {
      return "0$digit";
    } else {
      return digit.toString();
    }
  }
}
