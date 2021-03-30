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
        participants: json["idParticipants"]?.split(",") ?? [],
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
        'idParticipants': participants.isNotEmpty
            ? participants.join(",")
            : null,
        'status': status,
      };

  Map<String, String> toQueryParams() {
    var queryParams = Map<String, String>();
    if (idReservation != null) {
      queryParams['idReservation'] = idReservation.toString();
    }
    if (reservationDate != null) {
      queryParams['reservationDate'] =
          DateFormat('yyyy-MM-dd').format(reservationDate);
    }
    if (idRoom != null) {
      queryParams['idRoom'] = idRoom.toString();
    }
    if (idHandler != null) {
      queryParams['idHandler'] = idHandler.toString();
    }
    if (freeHandler != null) {
      queryParams['freeHandler'] = freeHandler.toString();
    }
    if (startMinutes != null) {
      queryParams['startMinutes'] = startMinutes.toString();
    }
    if (endMinutes != null) {
      queryParams['endMinutes'] = endMinutes.toString();
    }
    if (startHour != null) {
      queryParams['startHour'] = startHour.toString();
    }
    if (endHour != null) {
      queryParams['endHour'] = endHour.toString();
    }
    if (description != null) {
      queryParams['description'] = description;
    }
    if (status != null) {
      queryParams['status'] = status.toString();
    }
    if (participants != null && participants.isNotEmpty) {
      queryParams['participants'] = participants.join(",");
    }
    return queryParams;
  }
}
