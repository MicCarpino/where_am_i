import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/entities/reservation.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/usecases/users/get_user_by_id.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

// this widget show a dialog reporting details of the reservation selected
class ReservationDetailsDialog extends StatelessWidget {
  final Reservation reservation;
  final serviceLocator = GetIt.instance;

  ReservationDetailsDialog({@required this.reservation});

  @override
  Widget build(BuildContext context) {
    final dialogContent = Padding(
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
              future: _getReferentName(),
              builder: (context, snapshot) =>
                  snapshot.hasData && snapshot.data != null
                      ? Text('${snapshot.data.surname} ${snapshot.data.name}')
                      : Text('ID risorsa: ${reservation.idHandler}')),
          Divider(),
          Text('Orario', style: reservationLabelStyle),
          SizedBox(height: 8),
          Text(formatReservationTime()),
          Divider(),
          Text('Partecipanti', style: reservationLabelStyle),
          SizedBox(height: 8),
          Text(reservation.participants != null &&
                  reservation.participants.isNotEmpty
              ? reservation.participants.join(",")
              : "Nessun partecipante indicato"),
        ],
      ),
    );
    return ResponsiveBuilder.buildDialog(context, dialogContent);
  }

  String formatReservationTime() {
    String startHour = formatDigitTime(reservation.startHour);
    String startMinutes = formatDigitTime(reservation.startMinutes);
    String endHour = formatDigitTime(reservation.endHour);
    String endMinutes = formatDigitTime(reservation.endMinutes);
    return '$startHour.$startMinutes-$endHour.$endMinutes';
  }

  String formatDigitTime(int digit) {
    return digit < 10 ? "0$digit" : digit.toString();
  }

  //retrieve the resource name and surname from the DNC resources list by id
  //for some reason doesn't works on web/desktop builds
  Future<User> _getReferentName() async {
    final userFetchResult = await serviceLocator<GetUserById>()
        .call(reservation.idHandler.toString());
    return userFetchResult.fold((l) => null, (user) => user);
  }
}
