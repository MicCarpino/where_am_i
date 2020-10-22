import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

class ReservationModel extends Reservation {
  ReservationModel({
    @required int idReservation,
    @required DateTime reservationDate,
    @required int idRoom,
    @required int idHandler,
    @required String freeHandler,
    @required int startMinutes,
    @required int endMinutes,
    @required int startHour,
    @required int endHour,
    @required String description,
    @required List<String> participants,
    @required int status,
  }) : super(
          idReservation: idReservation,
          reservationDate: reservationDate,
          idRoom: idRoom,
          idHandler: idHandler,
          freeHandler: freeHandler,
          startMinutes: startMinutes,
          endMinutes: endMinutes,
          startHour: startHour,
          endHour: endHour,
          description: description,
          participants: participants,
          status: status,
        );

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
        idReservation: json["idReservation"],
        reservationDate: (DateTime.parse(json['reservationDate'])),
        idRoom: json["idRoom"],
        idHandler: json["idHandler"],
        freeHandler: json["freeHandler"],
        startMinutes: json["startMinutes"],
        endMinutes: json["endMinutes"],
        startHour: json["startHour"],
        endHour: json["endHour"],
        description: json["description"],
        participants: json["idParticipants"].split(","),
        status: json["status"]);
  }

  Map<String, dynamic> toJson() => {
        'idReservation': idReservation,
        'reservationDate': DateFormat('yyyy-MM-dd').format(reservationDate),
        'idRoom': idRoom,
        'idHandler': idHandler,
        'freeHandler': freeHandler,
        'startHour': startHour,
        'startMinutes': startMinutes,
        'endHour': endHour,
        'endMinutes': endMinutes,
        'description': description,
        'idParticipants': participants.length > 1
            ? participants.join(",")
            : participants.first,
        'status': status,
      };
}
