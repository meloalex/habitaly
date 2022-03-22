import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final Color smallCircle;
  final Color bigCircle;

  BackgroundPainter({
    this.smallCircle = Colors.white,
    @required this.bigCircle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint darkCirclePaint = Paint();
    final Paint lightCirclePaint = Paint();

    darkCirclePaint.color = bigCircle;
    lightCirclePaint.color = smallCircle;

    final Path darkCircle = Path();
    final Path lightCircle = Path();

    darkCircle.addOval(Rect.fromCircle(center: Offset(0, 0), radius: 150.0));
    lightCircle.addOval(Rect.fromCircle(center: Offset(0, 0), radius: 115.0));

    darkCircle.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 3), radius: 150.0));
    lightCircle.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 3), radius: 115.0));

    darkCircle.addOval(Rect.fromCircle(
        center: Offset(size.width / 4, size.height), radius: 150.0));
    lightCircle.addOval(Rect.fromCircle(
        center: Offset(size.width / 4, size.height), radius: 115.0));

    canvas.drawPath(darkCircle, darkCirclePaint);
    canvas.drawPath(lightCircle, lightCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
