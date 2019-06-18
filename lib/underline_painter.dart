import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UnderLinePainter extends CustomPainter {
  final Color color;

  UnderLinePainter({
    @required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final paint = Paint();
    paint.color = color;
    canvas.drawPath(_path(size), paint);
    canvas.restore();
  }

  _path(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
