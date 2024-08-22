import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_application/onboarding%20.dart';
import 'package:food_application/splash/splash1.dart';
import 'package:food_application/splash/splash2.dart';
import 'package:food_application/view/forgotPassword.dart';
import 'package:food_application/view/homeScreen.dart';
import 'package:food_application/view/logIn.dart';
import 'package:food_application/view/signUp.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter(); // Initialize Hive
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home': (context) => Homescreen(),
          '/login': (context) => Login(),
          '/signup': (context) => Signup(),
          '/forgot': (context) => Forgotpassword(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
