import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
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

  Reservation(
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
