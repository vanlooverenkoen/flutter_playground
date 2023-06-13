import 'package:flutter/material.dart';
import 'package:light_dark_mode/widget/light_mode_footer.dart';
import 'package:light_dark_mode/widget/light_mode_header.dart';
import 'package:light_dark_mode/widget/light_mode_scene.dart';
import 'package:light_dark_mode/widget/lightmode_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LightModeHeader(isLightMode: _isLightMode),
          const Spacer(),
          LightModeScene(isLightMode: _isLightMode),
          const Spacer(),
          LightModeSwitch(
            isLightMode: _isLightMode,
            onLightModeChanged: _onLightModeChanged,
          ),
          const Spacer(),
          LightModeFooter(isLightMode: _isLightMode),
        ],
      ),
    );
  }

  void _onLightModeChanged(bool value) {
    setState(() => _isLightMode = value);
  }
}
