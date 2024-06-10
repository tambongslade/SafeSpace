import 'dart:async';

import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Screens/onboardingscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
   Timer(Duration(seconds: 2),
     () => Navigator.of(context).pushReplacement(
       MaterialPageRoute(builder: (context) => Onboardingscreen()),
     ),
   );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset("assets/images/logo.png"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: green,
         
        ),
      ),
    );
  }
}