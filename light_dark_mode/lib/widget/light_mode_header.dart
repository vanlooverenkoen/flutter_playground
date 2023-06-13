import 'package:flutter/material.dart';
import 'package:light_dark_mode/widget/light_mode_lights.dart';

class LightModeHeader extends StatelessWidget {
  final bool isLightMode;

  const LightModeHeader({
    required this.isLightMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          color: isLightMode ? const Color(0xFFFCF8D3) : const Color(0xFFF1FCFC),
          child: const SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Figma Micro Animations',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'In Flutter',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
        Stack(
          children: [
            LightModeLights(show: !isLightMode),
            LightModeLights.filled(show: isLightMode),
          ],
        ),
      ],
    );
  }
}
