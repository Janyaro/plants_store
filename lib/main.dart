import 'package:flutter/material.dart';
import 'package:plantsapp/Screens/Auth_Screens/forget_password.dart';
import 'package:plantsapp/Screens/Auth_Screens/login_screen.dart';
import 'package:plantsapp/Screens/Auth_Screens/sign_out.dart';
import 'package:plantsapp/Screens/onboarding_screen.dart';
import 'package:plantsapp/Screens/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen()
    );
  }
}

