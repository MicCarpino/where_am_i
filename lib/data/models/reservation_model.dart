import 'package:meta/meta.dart';
import 'package:where_am_i/domain/entities/reservation.dart';

class ReservationModel extends Reservation {
  ReservationModel({
    @required int idReservation,
    @required String reservationDate,
    @required int idRoom,
    @required int idHandler,
    @required String freeHandler,
    @required int startMinutes,
    @required int endMinutes,
    @required int startHour,
    @required int endHour,
    @required String description,
    @required String idParticipants,
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
          idParticipants: idParticipants,
          status: status,
        );

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
