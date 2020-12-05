import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';

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
}

extension UserWithWorkstationResourceLabel on UserWithWorkstation {
  String getResourceLabel() {
    String label;
    if (this.user != null) {
      label = "${this.user.surname} ${this.user.name}";
    } else if (this.workstation.freeName != null) {
      label = this.workstation.freeName;
    } else {
      label = "N/A";
    }
    return label;
  }
}


extension UserWithWorkstationListSorter on List<UserWithWorkstation> {
  List<UserWithWorkstation> sortBySurnameAndName() {
    this.sort((a, b) {
      int surnameResult = a.user.surname.compareTo(b.user.surname);
      return surnameResult != 0
          ? surnameResult
          : a.user.name.compareTo(b.user.name);
    });
    return this;
  }

  List<UserWithWorkstation> sortByFreeName() {
    this.sort(
            (a, b) => a.workstation.freeName.compareTo(b.workstation.freeName));
    return this;
  }
}
