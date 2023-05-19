import 'package:flutter/material.dart';

class CircleDiagram extends StatelessWidget {
  final double radius;
  final List<CircleElement> elements;
  final Color borderColor;

  const CircleDiagram({
    required this.radius,
    required this.elements,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: CircleDiagramPainter(elements, borderColor),
    );
  }
}

class CircleDiagramPainter extends CustomPainter {
  final List<CircleElement> elements;
  final Color borderColor;

  CircleDiagramPainter(this.elements, this.borderColor);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(Offset(radius, radius), radius, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CircleElement {
  final double percentage;
  final Color color;

  CircleElement({required this.percentage, required this.color});
}
