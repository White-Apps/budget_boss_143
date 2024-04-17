import 'package:flutter/material.dart';
import 'dart:math' as math;

class PieChartPainterUjfknvsdjvd extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double lineWidth;

  PieChartPainterUjfknvsdjvd(
      {required this.values, required this.colors, this.lineWidth = 10});

  @override
  void paint(Canvas canvas, Size size) {
    double total = values.fold(0, (sum, item) => sum + item);
    double startRadiTrwgwgw = -math.pi / 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    Paint segmentPaint = Paint()..style = PaintingStyle.fill;
    Paint linePaintiiiWedsdds = Paint()
      ..color = Colors.black
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.butt;

    for (int i = 0; i < values.length; i++) {
      double sweepRaFRyugjkhvsd = values[i] / total * 2 * math.pi;
      segmentPaint.color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadiTrwgwgw,
        sweepRaFRyugjkhvsd,
        true,
        segmentPaint,
      );

      Offset startLine = center +
          Offset(
            radius * math.cos(startRadiTrwgwgw),
            radius * math.sin(startRadiTrwgwgw),
          );
      Offset endLine = center +
          Offset(
            radius * math.cos(startRadiTrwgwgw + sweepRaFRyugjkhvsd),
            radius * math.sin(startRadiTrwgwgw + sweepRaFRyugjkhvsd),
          );

      if (i > 0) {
        canvas.drawLine(center, startLine, linePaintiiiWedsdds);
      }

      startRadiTrwgwgw += sweepRaFRyugjkhvsd;
    }

    Offset endOfLastSegment = center +
        Offset(
          radius * math.cos(startRadiTrwgwgw),
          radius * math.sin(startRadiTrwgwgw),
        );
    canvas.drawLine(center, endOfLastSegment, linePaintiiiWedsdds);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
