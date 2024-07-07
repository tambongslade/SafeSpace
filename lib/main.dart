// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safespace/Screens/Authentication/provider.dart';
import 'package:safespace/Screens/splashScreen.dart';
// import 'package:safespace/firebase_options.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>UserProvider(),
      child:const MyApp()
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Space',
      home: Splashscreen(),
    );
  }
}
