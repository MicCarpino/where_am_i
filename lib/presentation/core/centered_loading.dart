import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';

class CenteredLoading extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  CenteredLoading({this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width ?? 100,
      height: this.height ?? 300,
      color: this.color ?? Colors.transparent,
      child: Center(
          child: Theme.of(context).platform == TargetPlatform.iOS
              ? CupertinoActivityIndicator()
              : CircularProgressIndicator(backgroundColor: dncBlue)),
    );
  }
}
