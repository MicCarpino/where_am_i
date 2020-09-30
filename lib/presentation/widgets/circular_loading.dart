import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 300,
      child: Center(
        child: CircularProgressIndicator(backgroundColor: dncBlue),
      ),
    );
  }
}
