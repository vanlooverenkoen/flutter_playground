import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LightModeFooter extends StatelessWidget {
  final bool isLightMode;

  const LightModeFooter({
    required this.isLightMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(
        begin: isLightMode ? const Color(0xFF300C0D) : const Color(0xFF1D2F6F),
        end: isLightMode ? const Color(0xFF300C0D) : const Color(0xFF1D2F6F),
      ),
      duration: const Duration(milliseconds: 300),
      builder: (context, backgroundColor, child) => Stack(
        children: [
          Container(
            color: backgroundColor,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 72,
                width: double.infinity,
                child: Container(),
              ),
            ),
          ),
          AnimatedPositioned(
            left: isLightMode ? 30 : 172,
            curve: const ElasticOutCurve(0.95),
            duration: const Duration(milliseconds: 750),
            child: SizedBox(
              width: 96,
              height: 96,
              child: CustomPaint(
                painter: FooterWavePainter(color: backgroundColor ?? Colors.transparent),
                child: Container(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: isLightMode ? 0.0 : 16.0),
                curve: const ElasticOutCurve(0.95),
                duration: const Duration(milliseconds: 300),
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0, value),
                  child: child,
                ),
                child: PhosphorIcon(
                  PhosphorIcons.duotone.sun,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: isLightMode ? 16.0 : 0.0),
                curve: const ElasticOutCurve(0.95),
                duration: const Duration(milliseconds: 300),
                builder: (context, value, child) => Transform.translate(
                  offset: Offset(0, value),
                  child: child,
                ),
                child: PhosphorIcon(
                  PhosphorIcons.duotone.moon,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FooterWavePainter extends CustomPainter {
  final Color color;

  FooterWavePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    final paint2 = Paint();
    paint2.color = color;
    paint2.style = PaintingStyle.fill;
    Path path = Path();

    path.lineTo(0, 0);
    const factor1 = 2;
    const factor2 = 3;
    //first curve
    path.cubicTo(size.width / factor1, 0, size.width / factor1, 2 * size.height / factor2, 2 * size.width / factor1, 2 * size.height / factor2);
    path.cubicTo(3 * size.width / factor1, 2 * size.height / factor2, 3 * size.width / factor1, 0, 4 * size.width / factor1, 0);

    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(size.width, size.height / 6), 32, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
