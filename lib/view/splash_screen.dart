import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  Future<void> waitSplash() async => _timer = Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())));

  @override
  void initState() {
    super.initState();
    waitSplash();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RepaintBoundary(
          child: CircularProgressIndicator(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
