import 'package:car_3d/widget/general/home_button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomUnLockLayout extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onUnLockTapped;

  const BottomUnLockLayout({
    required this.isOpen,
    required this.onUnLockTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            child: HomeButton.text(
              onTap: onUnLockTapped,
              text: isOpen ? 'Lock' : 'Unlock',
              iconData: isOpen ? PhosphorIcons.duotone.lockOpen : PhosphorIcons.duotone.lock,
            ),
          ),
        ],
      ),
    );
  }
}
