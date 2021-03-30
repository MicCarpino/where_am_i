import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:where_am_i/data/models/reservation_model.dart';

class Reservation extends Equatable {
  final int idReservation;
  final DateTime reservationDate;
  final int idRoom;
  final int idHandler;
  final String freeHandler;
  final int startMinutes;
  final int endMinutes;
  final int startHour;
  final int endHour;
  final String description;
  final List<String> participants;
  final int status;

  Reservation({
    @required this.idReservation,
    @required this.reservationDate,
    @required this.idRoom,
    @required this.idHandler,
    @required this.startMinutes,
    @required this.endMinutes,
    @required this.startHour,
    @required this.endHour,
    @required this.description,
    @required this.participants,
    @required this.status,
    this.freeHandler,
  });

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
        participants,
        status
      ];

  ReservationModel toReservationModel() => ReservationModel(
      idReservation: (idReservation),
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
      status: status);

  Reservation copyWith({
    int idReservation,
    DateTime reservationDate,
    int idRoom,
    int idHandler,
    String freeHandler,
    int startMinutes,
    int endMinutes,
    int startHour,
    int endHour,
    String description,
    List<String> participants,
    int status,
  }) {
    return Reservation(
      idReservation: idReservation ?? this.idReservation,
      reservationDate: reservationDate ?? this.reservationDate,
      idRoom: idRoom ?? this.idRoom,
      idHandler: idHandler ?? this.idHandler,
      freeHandler: freeHandler ?? this.freeHandler,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
      startHour: startHour ?? this.startHour,
      endHour: endHour ?? this.endHour,
      description: description ?? this.description,
      participants: participants ?? this.participants,
      status: status ?? this.status,
    );
  }
}
