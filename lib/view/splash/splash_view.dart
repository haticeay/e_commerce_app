import 'package:flutter/material.dart';
import 'package:heraninda/assets.dart';
import 'dart:async';

import 'package:heraninda/view/welcome/welcome_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Belirli bir süre sonra ana ekrana geçiş yap
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  WelcomeView()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(205, 214, 245, 1),
      body: Center(
        child: Image.asset(Assets.image.imLogoPNG)
      ),
    );
  }
}