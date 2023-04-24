import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_field/widget/password_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff60A5fD),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.transparent),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: PasswordField(),
          ),
        ),
      ),
    );
  }
}
