import 'package:flutter/material.dart';
import 'package:underline_otp_text_field/underline_painter.dart';

class UnderLine extends StatelessWidget {
  final Color color;

  UnderLine({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        child: Container(
          width: 40.0,
          height: 1.0,
        ),
        painter: UnderLinePainter(color: color),
      );
}
