import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LightModeLights extends StatelessWidget {
  final bool show;
  final bool filled;

  const LightModeLights({
    required this.show,
    super.key,
  }) : filled = false;

  const LightModeLights.filled({
    required this.show,
    super.key,
  }) : filled = true;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
        curve: Curves.easeInOut,
        opacity: show ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RotatedBox(
            quarterTurns: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < 7; ++i)
                  PhosphorIcon(
                    filled ? PhosphorIcons.fill.lightbulb : PhosphorIcons.regular.lightbulb,
                    color: show ? const Color(0xfffbeb7a) : const Color(0xfffbfcdb),
                    size: 32,
                  ),
              ],
            ),
          ),
        ),
      );
}
