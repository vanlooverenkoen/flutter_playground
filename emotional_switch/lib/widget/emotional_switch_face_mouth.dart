import 'package:emotional_switch/style/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class EmotionalSwitchFaceMouth extends StatelessWidget {
  const EmotionalSwitchFaceMouth({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: _EmotionalSwitchFaceMouthPainter(),
      size: Size(16, 8),
    );
  }
}

class _EmotionalSwitchFaceMouthPainter extends CustomPainter {
  const _EmotionalSwitchFaceMouthPainter();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ThemeColors.colorEyes
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawArc(Rect.fromCircle(center: const Offset(8, 0), radius: 8), 0, math.pi, false, paint);
  }

  @override
  bool shouldRepaint(_EmotionalSwitchFaceMouthPainter oldDelegate) => false;
}
