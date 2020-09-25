import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
  int idReservation;
  String reservationDate;
  int idRoom;
  int idHandler;
  String freeHandler;
  int startMinutes;
  int endMinutes;
  int startHour;
  int endHour;
  String description;
  String idParticipants;
  int status;

  Reservation(
      {this.idReservation,
      this.reservationDate,
      this.idRoom,
      this.idHandler,
      this.freeHandler,
      this.startMinutes,
      this.endMinutes,
      this.startHour,
      this.endHour,
      this.description,
      this.idParticipants,
      this.status});

  @override
  List<Object> get props => [
        idReservation,
        reservationDate,
        idRoom,
        idHandler,
        freeHandler,
        startMinutes,
        endMinutes,
        startHour,
        endHour,
        description,
        idParticipants,
        status
      ];
}
