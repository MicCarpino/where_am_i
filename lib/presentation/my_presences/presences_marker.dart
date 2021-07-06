import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'dart:math';

class PresencesMarker extends StatelessWidget {
  final Workstation workstation;

  PresencesMarker({this.workstation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: MarkerPainter(
              context,
              workstation.startTime,
              workstation.endTime,
              workstation.status,
            ),
          )),
    );
  }
}

class MarkerPainter extends CustomPainter {
  final BuildContext context;
  final int status;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  MarkerPainter(this.context, this.startTime, this.endTime, this.status);

  @override
  void paint(Canvas canvas, Size size) {
    final circleWidth = size.width * 0.14;
    final externalRadiusMultiplier = 0.45;
    var paint = Paint();
    if (status == WORKSTATION_STATUS_PENDING) {
      paint.color = dncBlue;
    } else if (status == WORKSTATION_STATUS_CONFIRMED) {
      paint.color = dncOrange;
    } else {
      paint.color = Colors.red[500];
    }
    var path = Path();
    //full day, drawing full circle
    if (startTime == TIME_SLOT_NINE && endTime == TIME_SLOT_EIGHTEEN) {
      paint.style = PaintingStyle.stroke;
      //circle's width
      paint.strokeWidth = circleWidth;
      canvas.drawCircle(
        //circle's center position
        Offset(size.width * 0.5, size.height * 0.5),
        //circle's internal radius
        (size.width - circleWidth) * externalRadiusMultiplier,
        paint,
      );
    } else {
      paint.style = PaintingStyle.fill;
      final startingPoint = size.width * (0.5 - externalRadiusMultiplier);
      final endingPoint = size.width * (0.5 + externalRadiusMultiplier);
      path.moveTo(startingPoint, size.height * 0.5);
      path.arcToPoint(
        Offset(endingPoint, size.height * 0.5),
        radius: Radius.circular(1),
      );
      path.lineTo(endingPoint - circleWidth, size.height * 0.5);
      path.arcToPoint(Offset(startingPoint + circleWidth, size.height * 0.5),
          radius: Radius.circular(1), clockwise: false);
      path.lineTo(startingPoint, size.height * 0.5);
      //rotation
      bool isMorningSlot =
          startTime == TIME_SLOT_NINE && endTime == TIME_SLOT_THIRTEEN;
      final angle = (isMorningSlot ? -45.0 : 135) * pi / 180;
      _rotateCanvasAroundCenter(canvas, size, angle);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  _rotateCanvasAroundCenter(Canvas canvas, Size size, double angle) {
    final double r =
        sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha = atan(size.height / size.width);
    final beta = alpha + angle;
    final shiftY = r * sin(beta);
    final shiftX = r * cos(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;
    canvas.translate(translateX, translateY);
    canvas.rotate(angle);
  }
}
