import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/styles.dart';

class RoomLabel extends StatelessWidget {

  final String labelText;

  RoomLabel({@required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child:
      Text(labelText, style: roomLabelStyle),
    );
  }
}
