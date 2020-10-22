import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';

final loginLabelStyle = TextStyle(
  color: dncBlue,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final loginBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final roomLabelStyle = TextStyle(
  fontSize: 20,
);

final reservationLabelStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.black54,
);
