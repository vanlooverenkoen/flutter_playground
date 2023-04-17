import 'package:emotional_switch/style/duration.dart';
import 'package:emotional_switch/widget/emotional_switch.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isHappy = true;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnimatedContainer(
          color: _isHappy ? const Color(0xFF22BAA8) : const Color(0xFF6E6E6E),
          curve: Curves.easeInOut,
          duration: ThemeDuration.short,
          child: Center(
            child: EmotionalSwitch(
              isHappy:_isHappy,
              onChanged: _onChanged,
            ),
          ),
        ),
      );

  void _onChanged(bool isHappy) => setState(() => _isHappy = isHappy);
}
