import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class PresencesMarker extends StatelessWidget {
  final Workstation workstation;

  PresencesMarker({this.workstation});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        child: CustomPaint(
          child: Center(
            child: Text('${workstation.workstationDate.day}',
                style:
                    TextStyle().copyWith(color: Colors.black, fontSize: 14.0)),
          ),
          painter: MarkerPainter(
              workstation.startTime, workstation.endTime, workstation.status),
        ));
  }
}

class MarkerPainter extends CustomPainter {
  final int status;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  MarkerPainter(this.startTime, this.endTime, this.status);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    if (status == WORKSTATION_STATUS_PENDING) {
      paint.color = dncBlue;
    } else if (status == WORKSTATION_STATUS_CONFIRMED) {
      paint.color = dncOrange;
    } else {
      paint.color = Colors.red[500];
    }
    paint.style = PaintingStyle.fill;
    var path = Path();
    //full day, drawing full circle
    if (startTime == TIME_SLOT_NINE && endTime == TIME_SLOT_EIGHTEEN) {
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), size.width / 2, paint);
      canvas.drawCircle(Offset(size.width / 2, size.height / 2),
          size.width / 3.5, Paint()..color = Colors.white);
    } else {
      _drawHalfCenterAngled(path, size);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  _drawHalfCenterAngled(Path path, Size size) {
    //establishing if should draw arcs clockwise (half circle top left)
    bool isMorningSlot =
        startTime == TIME_SLOT_NINE && endTime == TIME_SLOT_THIRTEEN;
    path.moveTo(size.width * 0.15, size.height * 0.85);
    path.arcToPoint(Offset(size.width * 0.85, size.height * 0.15),
        radius: Radius.circular(size.width / 10), clockwise: isMorningSlot);
    path.lineTo(size.width * 0.7, size.height * 0.30);
    path.arcToPoint(Offset(size.width * 0.30, size.height * 0.7),
        radius: Radius.circular(size.width / 10), clockwise: !isMorningSlot);
    path.lineTo(size.width * 0.15, size.height * 0.85);
  }
}
