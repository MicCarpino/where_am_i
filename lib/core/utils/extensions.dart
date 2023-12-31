import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';

import 'constants.dart';
import 'enums.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension StringContainsCaseInsensitive on String {
  bool containsCaseInsensitive(String otherString) {
    return this.toLowerCase().contains(otherString.toLowerCase());
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
  //Date with only year, month and day valued.
  //Minutes,seconds and milliseconds are set to zero
  DateTime zeroed() {
    return DateTime(this.year, this.month, this.day);
  }

  bool isAtSameMomentOrAfter(DateTime otherDate) {
    return this.isAfter(otherDate) || this.isAtSameMomentAs(otherDate);
  }

  bool isAfterTimeLess(DateTime otherDate) {
    return this.zeroed().isAfter(otherDate.zeroed());
  }

  bool isBeforeTimeLess(DateTime otherDate) {
    return this.zeroed().isBefore(otherDate.zeroed());
  }

  bool isAtSameMomentTimeLess(DateTime otherDate) {
    return this.zeroed().isAtSameMomentAs(otherDate.zeroed());
  }
}

extension UserWithWorkstationListSorter on List<UserWithWorkstation> {
  //extensions to easily sort a list of UserWithWorkstation objects
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

extension IterableNullOrEmpty on Iterable {
  bool isNullOrEmpty() => this == null || this.isEmpty;
}

//determine "device type" on screen width
extension DeviceTypeExtension on MediaQueryData {
  DeviceType get deviceType {
    if (size.width >= 1500) return DeviceType.desktop;
    if (size.width >= 600) return DeviceType.tablet;
    return DeviceType.mobile;
  }
}
