import 'package:flutter/material.dart';
import 'dart:math' as math;

class PieChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double lineWidth;

  PieChartPainter(
      {required this.values, required this.colors, this.lineWidth = 10});

  @override
  void paint(Canvas canvas, Size size) {
    double total = values.fold(0, (sum, item) => sum + item);
    double startRadian = -math.pi / 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    Paint segmentPaint = Paint()..style = PaintingStyle.fill;
    Paint linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.butt;

    for (int i = 0; i < values.length; i++) {
      double sweepRadian = values[i] / total * 2 * math.pi;
      segmentPaint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        true,
        segmentPaint,
      );

      Offset startLine = center +
          Offset(
            radius * math.cos(startRadian),
            radius * math.sin(startRadian),
          );
      Offset endLine = center +
          Offset(
            radius * math.cos(startRadian + sweepRadian),
            radius * math.sin(startRadian + sweepRadian),
          );

      if (i > 0) {
        canvas.drawLine(center, startLine, linePaint);
      }

      startRadian += sweepRadian;
    }

    Offset endOfLastSegment = center +
        Offset(
          radius * math.cos(startRadian),
          radius * math.sin(startRadian),
        );
    canvas.drawLine(center, endOfLastSegment, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
