import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'enums.dart';
import 'constants.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension TimeOfDayExtension on TimeOfDay {
  bool isBefore(TimeOfDay otherTime) {
    if (this.hour < otherTime.hour) {
      return true;
    } else if (this.hour == otherTime.hour && this.minute < otherTime.minute) {
      return true;
    }
    return false;
  }

  bool isAfter(TimeOfDay otherTime) {
    if (this.hour > otherTime.hour) {
      return true;
    } else if (this.hour == otherTime.hour && this.minute > otherTime.minute) {
      return true;
    }
    return false;
  }

  bool isEqual(TimeOfDay otherTime) {
    if (this.hour == otherTime.hour && this.minute == otherTime.minute) {
      return true;
    } else {
      return false;
    }
  }

  double toDouble() => this.hour + this.minute / 60.0;

  String toJson() {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, this.hour, this.minute);
    final format = DateFormat.Hms(); //"6:00 AM"
    return format.format(dt);
  }
}

extension DateTimeToZero on DateTime {
  //Date with only year, month and day valorized.
  //Minutes,seconds and milliseconds are set to zero
  DateTime zeroed() {
    return DateTime(this.year, this.month, this.day);
  }

  bool isAtSameMomentOrAfter(DateTime otherDate) {
    return this.isAfter(otherDate) || this.isAtSameMomentAs(otherDate);
  }

  bool isAfterTimeLess(DateTime otherDate){
    return this.zeroed().isAfter(otherDate.zeroed());
  }
  bool isBeforeTimeLess(DateTime otherDate){
    return this.zeroed().isBefore(otherDate.zeroed());
  }
  bool isAtSameMomentTimeLess(DateTime otherDate){
    return this.zeroed().isAtSameMomentAs(otherDate.zeroed());
  }
}

extension UserWithWorkstationListSorter on List<UserWithWorkstation> {
  List<UserWithWorkstation> sortBySurnameAndName() {
    this.sort((a, b) {
      int surnameResult = a.user?.surname?.compareTo(b.user?.surname);
      return surnameResult != 0
          ? surnameResult
          : a.user?.name?.compareTo(b.user?.name);
    });
    return this;
  }

  List<UserWithWorkstation> sortByFreeName() {
    this.sort(
        (a, b) => a.workstation?.freeName?.compareTo(b.workstation?.freeName));
    return this;
  }
}

extension TimeSlotTimes on TimeSlot {
  TimeOfDay toStartTime() =>
      this == TimeSlot.evening ? TIME_SLOT_FOURTEEN : TIME_SLOT_NINE;

  TimeOfDay toEndTime() =>
      this == TimeSlot.morning ? TIME_SLOT_THIRTEEN : TIME_SLOT_EIGHTEEN;
}


extension RoomsTitles on Rooms {
  String roomIdTitle() {
    switch (this) {
      case Rooms.room_26B:
        return "Civico 26/B";
      case Rooms.room_26A_Floor1:
        return "Civico 26/A";
      case Rooms.room_24:
        return "Civico 24";
      default:
        return null;
    }
  }

  // ignore: missing_return
  String get roomTitle {
    switch (this) {
      case Rooms.room_26B:
        return 'Civico 26/B';
      case Rooms.room_26A_Floor1:
        return 'Civico 26/A 1°piano';
      case Rooms.room_26A_Floor2:
        return 'Civico 26/A 2°piano';
      case Rooms.room_24:
        return 'Civico 24';
      case Rooms.room_staff:
        return 'Amministrazione/Dirigenza';
    }
  }

  int get reservationRoomId {
    switch (this) {
      case Rooms.room_26B:
        return 26;
      case Rooms.room_26A_Floor2:
        return 262;
      case Rooms.room_24:
        return 24;
      default:
        return null;
    }
  }

  String get reservationRoomLabel{
    Map<int, String> reservationsRoomTitles = {
      26: "Civico 26/B",
      262: "Civico 26/A",
      24: "Civico 24",
    };
    return reservationsRoomTitles[this.reservationRoomId];
  }

  String get reservationRoomSuffix{
    Map<int, String> reservationsRoomTitles = {
      26: "26/B",
      262: "26/A",
      24: "24",
    };
    return reservationsRoomTitles[this.reservationRoomId];
  }
}
/*extension FailureErrorMessage on Failure {
  String getErrorMessageFromFailure() {
    String message = "Si è verificato un errore";
    if (this is ServerFailure) {
      message = (this as ServerFailure).errorMessage;
    } else if (this is UnexpectedFailure) {
      message = (this as UnexpectedFailure).errorMessage;
    } else if (this is CacheFailure) {
      message = "Errore cache";
    }
    print('FAILURE TYPE ${this.toString()}');
    print('FAILURE MSG: $message');
    return message;
  }
}*/
