import 'package:flutter/material.dart';

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

  bool isEqual(TimeOfDay otherTime){
    if (this.hour ==  otherTime.hour && this.minute == otherTime.minute) {
      return true;
    } else {
      return false;
    }
  }

}

extension DateTimeToZero on DateTime {
  //Date with only year, month and day valorized.
  //Minutes,seconds and milliseconds are set to zero
  DateTime zeroed(){
    return DateTime(this.year, this.month, this.day);
  }

  bool isAtSameMomentOrAfter(DateTime otherDate){
    return this.isAfter(otherDate) || this.isAtSameMomentAs(otherDate);
  }
}