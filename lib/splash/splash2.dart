import 'package:flutter/material.dart';
import 'package:food_application/onboarding%20.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
   void initState() {
    super.initState();
    // Delay for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(body: SafeArea(child: Stack(
  children: [
    Positioned.fill(
      child: Image.asset(
       "assets/background-removebg-preview.png",
        fit: BoxFit.cover,
      ),
    ),
    Center(
      child:Center(child: Image.asset
        ("assets/ImportedPhoto_1723789002897-removebg-preview.png",scale: 1,)) ,
    ),
  ],
)
),);
  
  }
}