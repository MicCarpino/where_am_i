import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

class ReservationModel extends Reservation {
  final int idReservation;
  final String reservationDate;
  final int idRoom;
  final int idHandler;
  final String freeHandler;
  final int startMinutes;
  final int endMinutes;
  final int startHour;
  final int endHour;
  final String description;
  final String idParticipants;
  final int status;

  ReservationModel(
      {@required this.idReservation,
      @required this.reservationDate,
      @required this.idRoom,
      @required this.idHandler,
      @required this.freeHandler,
      @required this.startMinutes,
      @required this.endMinutes,
      @required this.startHour,
      @required this.endHour,
      @required this.description,
      @required this.idParticipants,
      @required this.status});

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
        idReservation: json["idReservation"],
        reservationDate: json["reservationDate"],
        idRoom: json["idRoom"],
        idHandler: json["idHandler"],
        freeHandler: json["freeHandler"],
        startMinutes: json["startMinutes"],
        endMinutes: json["endMinutes"],
        startHour: json["startHour"],
        endHour: json["endHour"],
        description: json["description"],
        idParticipants: json["idParticipants"],
        status: json["status"]);
  }
}
