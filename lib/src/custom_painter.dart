import 'package:flutter/material.dart';

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    //Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.blue.shade300;
    canvas.drawPath(blueWave, paint);

    //Green
    Path greenWave = Path();
    greenWave.lineTo(0, sh);
    greenWave.lineTo(sw, sh);
    greenWave.cubicTo(
        sw * 0.87, sh * 0.45, sw * 0.65, sh * 0.55, sw * 0.36, sh * 0.38);
    greenWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.15, sh * 0.15, 0, sh * 0.4);

    greenWave.close();
    paint.color = Colors.greenAccent.shade200;
    canvas.drawPath(greenWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
