import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/usecases/get_user_by_id.dart';

class ReservationDetailsDialog extends StatelessWidget {
  final Reservation reservation;
  final serviceLocator = GetIt.instance;

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
            FutureBuilder<User>(
                future: _getUserName(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Text('${snapshot.data.surname} ${snapshot.data.name}')
                    : Text('ID risorsa: ${reservation.idHandler}')),
            Divider(),
            Text('Orario', style: reservationLabelStyle),
            SizedBox(height: 8),
            Text(formatTime()),
            Divider(),
            Text('Partecipanti', style: reservationLabelStyle),
            SizedBox(height: 8),
            Text(reservation.participants != null
                ? reservation.participants.join(",")
                : "Nessun partecipante indicato"),
          ],
        ),
      ),
    );
  }

  String formatTime() {
    return '${formatSingleDigitTime(reservation.startHour)}.${formatSingleDigitTime(reservation.startMinutes)} - ${formatSingleDigitTime(reservation.endHour)}.${formatSingleDigitTime(reservation.endMinutes)}';
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

  Future<User> _getUserName() async {
    var c = await serviceLocator<GetUserById>()
        .call(reservation.idHandler.toString());
    return c.fold((l) {
      print('left');
      return null;
    }, (r) {
      print(r.toString());
      return r;
    });
  }
}
