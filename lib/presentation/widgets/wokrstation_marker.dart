import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class WorkstationMarker extends CustomPainter {
  final Workstation workstation;

  WorkstationMarker(this.workstation);

  double internalRadiusRatio = 2.5;
  double morningArcPointRatio = 0.4;
  double afternoonArcPointRatio = 0.6;

  @override
  void paint(Canvas canvas, Size size) {
    if (workstation == null ||
        (workstation.startTime == TIME_SLOT_NINE &&
            workstation.endTime == TIME_SLOT_EIGHTEEN)) {
      return;
    }
    var paint = Paint();
    paint.color = dncOrange;
    paint.style = PaintingStyle.fill;
    var path = Path();
    _drawMorningMarker(path, size);
    _drawAfternoonMarker(path, size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  _drawMorningMarker(Path path, Size size) {
    path.moveTo(size.width * 0.04, 0);
    path.lineTo(size.width * morningArcPointRatio, 0);
    path.arcToPoint(Offset(0, size.height * morningArcPointRatio),
        radius: Radius.circular(size.width / internalRadiusRatio), clockwise: false);
    path.lineTo(0, size.height * 0.04);
    path.arcToPoint(Offset(size.width * 0.04, 0),
        radius: Radius.circular(size.width / internalRadiusRatio), clockwise: true);
  }

  _drawAfternoonMarker(Path path, Size size) {
    path.moveTo(size.width, size.height * 0.96);
    path.lineTo(size.width, size.height * afternoonArcPointRatio);
    path.arcToPoint(Offset(size.width * afternoonArcPointRatio, size.height),
        radius: Radius.circular(size.width / internalRadiusRatio),
        clockwise: true);
    path.lineTo(size.width * 0.96, size.height);
    path.arcToPoint(Offset(size.width, size.height * 0.96),
        radius: Radius.circular(size.width / internalRadiusRatio),
        clockwise: false);
  }
}
