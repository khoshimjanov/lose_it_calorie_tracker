import 'package:flutter/material.dart';

import 'dart:math' as math;


class CircleDiagramPainter extends CustomPainter {
  final double greenPercentage;
  final double redPercentage;
  final double bluePercentage;

  CircleDiagramPainter({
    required this.greenPercentage,
    required this.redPercentage,
    required this.bluePercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = radius * 0.3;
    const strokeColor = Color.fromARGB(220, 220, 220, 220);
    final strokePaint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15;

    // Calculate the angle range for each color based on the percentages
    final totalPercentage = greenPercentage + redPercentage + bluePercentage;
    final greenAngle = 2 * math.pi * (greenPercentage / totalPercentage);
    final redAngle = 2 * math.pi * (redPercentage / totalPercentage);
    final blueAngle = 2 * math.pi * (bluePercentage / totalPercentage);

    // Draw the grey lines for the inside and outside edges
    canvas.drawCircle(center, radius, strokePaint);
    canvas.drawCircle(center, radius - strokeWidth, strokePaint);

    // Draw the green arc
    final greenPaint = Paint()..color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      greenAngle,
      true,
      greenPaint,
    );

    // Draw the red arc
    final redPaint = Paint()..color = Colors.red;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + greenAngle,
      redAngle,
      true,
      redPaint,
    );

    // Draw the blue arc
    final bluePaint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + greenAngle + redAngle,
      blueAngle,
      true,
      bluePaint,
    );

    // Draw the inner white circle
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, radius - strokeWidth, whitePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
