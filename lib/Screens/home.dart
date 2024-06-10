import 'package:flutter/material.dart';
import 'package:safespace/Constants/styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.account_circle_outlined),
            SizedBox(width: 10,),
            Text("Hi, Profile", style:PoppinsBold.copyWith(fontSize: 14),)
          ],
        ),
        actions: [
          Icon(Icons.notifications_outlined),
        ],
      ),
    );
  }
}