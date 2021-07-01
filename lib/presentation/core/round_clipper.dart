import 'package:flutter/material.dart';

class RoundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(
        size.width / 6, size.height * 2 / 6, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width * 5 / 6, size.height * 4 / 6, size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}