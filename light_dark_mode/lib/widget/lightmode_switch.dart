import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LightModeSwitch extends StatelessWidget {
  final bool isLightMode;
  final ValueChanged<bool> onLightModeChanged;

  const LightModeSwitch({
    required this.isLightMode,
    required this.onLightModeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onLightModeChanged(!isLightMode),
      child: AnimatedContainer(
        height: 72,
        width: 200,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isLightMode ? const Color(0xFF83FC8B) : const Color(0xFFFDB3C1),
          borderRadius: BorderRadius.circular(66),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              spreadRadius: 8,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              curve: const ElasticOutCurve(0.95),
              left: isLightMode ? 20 : 137,
              duration: const Duration(milliseconds: 750),
              child: Text(
                isLightMode ? 'ON' : 'OFF',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.65),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            AnimatedPositioned(
              curve: const ElasticOutCurve(0.95),
              right: isLightMode ? 12 : 137,
              duration: const Duration(milliseconds: 750),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: PhosphorIcon(
                  isLightMode ? PhosphorIcons.duotone.sun : PhosphorIcons.duotone.moonStars,
                  color: isLightMode ? const Color(0xFF32AD44) : const Color(0xFFA5304E),
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
