import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/pages/my_presences_page.dart';

class PresencesMarker extends StatelessWidget {
  final fasciaOraria fa ;
  final bool status;
  final DateTime date;

  PresencesMarker({this.fa,this.date,this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        child: CustomPaint(
          child: Center(
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(color: Colors.black, fontSize: 14.0)
            ),
          ),
          painter: MarkerPainter(fa,status),
        ));
  }
}

class MarkerPainter extends CustomPainter {
  final bool status;
  final fasciaOraria fa;
  MarkerPainter(this.fa,this.status);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = status? dncBlue :dncOrange;
    paint.style = PaintingStyle.fill;

    var path = Path();
    if(fa == fasciaOraria.full){
      canvas.drawCircle(Offset(size.width/2,size.height/2), size.width/2, paint);
      canvas.drawCircle(Offset(size.width/2,size.height/2), size.width/4, Paint()..color = Colors.white);
    } else {
      _drawHalfCenterAngled(path,size);
      canvas.drawPath(path, paint);
     // canvas.drawCircle(Offset(size.width/2,size.height/2), size.width/2, Paint()..color = dncOrange ..style=PaintingStyle.stroke..strokeWidth =1);
     // canvas.drawCircle(Offset(size.width/2,size.height/2), size.width/4, Paint()..color = dncOrange ..style=PaintingStyle.stroke..strokeWidth =1);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  _drawFullCenterAngled(Path path, Size size){
    path.moveTo(size.width * 0.15, size.height * 0.85);
    path.arcToPoint(Offset(size.width * 0.85, size.height * 0.15), radius: Radius.circular(size.width /10),clockwise: fa == fasciaOraria.mattina);
    path.lineTo(size.width * 0.7, size.height * 0.30);
    path.arcToPoint(Offset(size.width * 0.30, size.height * 0.7), radius: Radius.circular(size.width / 10),clockwise: fa == fasciaOraria.mattina);
    path.lineTo(size.width * 0.15, size.height * 0.85);
  }
  _drawHalfCenterAngled(Path path, Size size){
    path.moveTo(size.width * 0.15, size.height * 0.85);
    path.arcToPoint(Offset(size.width * 0.85, size.height * 0.15), radius: Radius.circular(size.width /10),clockwise: fa == fasciaOraria.mattina);
    path.lineTo(size.width * 0.7, size.height * 0.30);
    path.arcToPoint(Offset(size.width * 0.30, size.height * 0.7), radius: Radius.circular(size.width / 10),clockwise: fa != fasciaOraria.mattina);
    path.lineTo(size.width * 0.15, size.height * 0.85);
  }
  _drawHalfCenterStraight(Path path, Size size){
    path.moveTo(0, size.height/2);
    path.arcToPoint(Offset(size.width, size.height/2), radius: Radius.circular(size.width /10),clockwise: fa == fasciaOraria.mattina);
    path.lineTo(size.width * 0.7, size.height/2);
    path.arcToPoint(Offset(size.width * 0.30, size.height/2), radius: Radius.circular(size.width / 10),clockwise: fa != fasciaOraria.mattina);
    path.lineTo(0, size.height /2);
  }
 _drawFullCenterStraight(Path path, Size size){
    path.moveTo(0, size.height/2);
    path.arcToPoint(Offset(size.width, size.height/2), radius: Radius.circular(size.width/2),clockwise: fa == fasciaOraria.mattina);
    path.lineTo(size.width * 0.8, size.height/2);
    path.arcToPoint(Offset(size.width * 0.20, size.height/2), radius: Radius.circular(size.width/4),clockwise: fa == fasciaOraria.mattina);
    path.lineTo(0, size.height /2);
  }


}