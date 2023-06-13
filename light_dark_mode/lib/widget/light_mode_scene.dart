import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LightModeScene extends StatelessWidget {
  final bool isLightMode;

  const LightModeScene({
    required this.isLightMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        height: 150,
        width: 300,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isLightMode ? const Color(0xFF85350c) : const Color(0xFF2456cb),
              isLightMode ? const Color(0xFFe29622) : const Color(0xFF8f86dd),
            ],
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 32,
              left: isLightMode ? 32 : 220,
              curve: const ElasticOutCurve(0.95),
              duration: const Duration(milliseconds: 900),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: PhosphorIcon(
                  key: ValueKey(isLightMode),
                  isLightMode ? PhosphorIcons.duotone.sun : PhosphorIcons.duotone.moonStars,
                  size: 56,
                  color: isLightMode ? const Color(0xFFfadf55) : const Color(0xFFcdf8fe),
                ),
              ),
            ),
            AnimatedPositioned(
              right: 16,
              bottom: isLightMode ? 25 : -50,
              curve: const ElasticOutCurve(0.95),
              duration: const Duration(milliseconds: 900),
              child: PhosphorIcon(
                PhosphorIcons.duotone.treePalm,
                size: 48,
                color: const Color(0xFF300100),
              ),
            ),
            AnimatedPositioned(
              left: isLightMode ? -32 : 20,
              top: isLightMode ? -32 : 20,
              curve: const ElasticOutCurve(0.95),
              duration: const Duration(milliseconds: 900),
              child: RotatedBox(
                quarterTurns: 1,
                child: PhosphorIcon(
                  PhosphorIcons.duotone.shootingStar,
                  size: 32,
                  color: const Color(0xFFc9f1fb),
                ),
              ),
            ),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 30),
                      end: const Offset(0, 0),
                    ).animate(animation),
                    child: child,
                  );
                },
                child: AnimatedDefaultTextStyle(
                  key: ValueKey(isLightMode),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    color: isLightMode ? const Color(0xFFfadf55) : const Color(0xFFcdf8fe),
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text(
                    isLightMode ? 'Light Mode' : 'Dark mode',
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: MountainClipper(),
              child: AnimatedContainer(
                color: isLightMode ? const Color(0xFF300100) : const Color(0xFF173186),
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MountainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(size.width * 0.2, size.height - 60, size.width * 0.4, size.height - 25);
    path.quadraticBezierTo(size.width * 0.5, size.height - 10, size.width * 0.6, size.height - 20);
    path.quadraticBezierTo(size.width * 0.8, size.height - 40, size.width * 0.9, size.height - 35);
    path.quadraticBezierTo(size.width * 0.975, size.height - 35, size.width * 1.1, size.height - 25);
    path.lineTo(size.width, size.height - 40);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
