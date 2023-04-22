import 'package:car_3d/widget/general/home_button.dart';
import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  const MapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeButton.child(
      onTap: () {},
      child: Image.asset(
        'assets/images/map.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
