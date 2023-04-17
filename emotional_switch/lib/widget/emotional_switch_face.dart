import 'package:emotional_switch/style/colors.dart';
import 'package:emotional_switch/style/duration.dart';
import 'package:emotional_switch/widget/emotional_switch_face_mouth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmotionalSwitchFace extends StatelessWidget {
  final bool isHappy;

  const EmotionalSwitchFace({
    required this.isHappy,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: ThemeDuration.short,
      curve: Curves.easeInOut,
      height: 64,
      width: 72,
      decoration: BoxDecoration(
        color: isHappy ? ThemeColors.colorHappyFace : ThemeColors.colorNotHappyFace,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: ThemeColors.shadow,
            blurRadius: 8,
            offset: Offset(0, 8),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: ThemeDuration.short,
            curve: Curves.easeInOut,
            alignment: isHappy ? Alignment.topLeft : Alignment.bottomLeft,
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: ThemeColors.colorEyes,
                shape: BoxShape.circle,
              ),
            ),
          ),
          AnimatedAlign(
            duration: ThemeDuration.short,
            curve: Curves.easeInOut,
            alignment: isHappy ? Alignment.topRight : Alignment.bottomRight,
            child: Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: ThemeColors.colorEyes,
                shape: BoxShape.circle,
              ),
            ),
          ),
          AnimatedAlign(
            alignment: isHappy ? Alignment.bottomCenter : Alignment.topCenter,
            curve: Curves.easeInOut,
            duration: ThemeDuration.short,
            child: const EmotionalSwitchFaceMouth(),
          ),
        ],
      ),
    );
  }
}
