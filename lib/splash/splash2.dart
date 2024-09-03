import 'package:flutter/material.dart';
import 'package:food_application/onboarding%20.dart';
import 'package:food_application/view/homeScreen.dart';
import 'package:hive/hive.dart';
// Replace with your actual home screen

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    // Initialize Hive and check for stored data
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Open the Hive box
    final box = await Hive.openBox('logindata');

    // Check if the email and password are stored
    final email = box.get('email');
    final password = box.get('password');

    // Delay for 3 seconds to show splash screen
    await Future.delayed(Duration(seconds: 3));

    // Navigate based on the availability of stored data
    if (email != null && password != null) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
            builder: (context) => Homescreen()), // Navigate to the home screen
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const OnboardingScreen()), // Navigate to the login page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 5,
              left: 5,
              child: Image.asset(
                "assets/background-removebg-preview.png",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/ImportedPhoto_1723789002897-removebg-preview.png",
                scale: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
