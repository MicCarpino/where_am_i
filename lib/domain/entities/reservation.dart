import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
  final int idReservation;
  final String reservationDate;
  final int idRoom;
  final int idHandler;
  final String freeHandler;
  final int startMinutes;
  final   int endMinutes;
  final int startHour;
  final int endHour;
  final String description;
  final String idParticipants;
  final int status;

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
