import 'package:flutter/material.dart';
import 'package:workplace/screens/auth/signup_screen.dart';
import '../auth/login_screen.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(Icons.business, size: 80),
            Image.asset('assets/images/logo.png', width: 150, height: 150),

            SizedBox(height: 20),

            Text(
              "Workplace Portal",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

