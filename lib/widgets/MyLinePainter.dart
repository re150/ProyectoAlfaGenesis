import 'package:flutter/material.dart';


class LinePainter extends CustomPainter{
  final Offset start;
  final Offset end;

  LinePainter({required this.start, required this.end});

  @override
  void paint(Canvas canvas, Size size){
    final paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2.0
    ..style = PaintingStyle.stroke;

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }

}