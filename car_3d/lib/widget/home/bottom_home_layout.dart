import 'package:car_3d/widget/general/home_button.dart';
import 'package:car_3d/widget/home/map_button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomHomeLayout extends StatelessWidget {
  final VoidCallback onDoorsTapped;
  final bool isOpen;

  const BottomHomeLayout({
    required this.isOpen,
    required this.onDoorsTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomeButton.text(
                    onTap: onDoorsTapped,
                    text: isOpen ? 'Lock' : 'Unlock',
                    iconData: isOpen ? PhosphorIcons.duotone.lockOpen : PhosphorIcons.duotone.lock,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: HomeButton.text(
                          onTap: () {},
                          text: 'Lights',
                          color: Colors.amber,
                          iconData: PhosphorIcons.duotone.lightbulb,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: HomeButton.text(
                          onTap: () {},
                          text: 'Climate',
                          color: Colors.green,
                          iconData: PhosphorIcons.duotone.fan,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(
            child: MapButton(),
          ),
        ],
      ),
    );
  }
}
