import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_field/widget/password_field.dart';
import 'package:password_field/widget/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff60A5fD),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.transparent),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                PasswordField(),
                SizedBox(height: 16),
                SearchField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
