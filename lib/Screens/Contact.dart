import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/components/Contactcard.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.account_circle_outlined),
            SizedBox(
              width: 10,
            ),
            Text(
              "Hi, Profile",
              style: PoppinsBold.copyWith(fontSize: 14),
            )
          ],
        ),
        actions: [
          Icon(Icons.notifications_outlined),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Contact Emergency",
              style: PoppinsBold.copyWith(fontSize: 40,color: Hgreen),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Contacts",
              style: PoppinsBold.copyWith(fontSize: 20),
            ),
            Container(
              height: 150,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Contactcard(),
                  Contactcard(),
                  Contactcard(),
                ],
              ),
            ),
            Text(
              "Services",
              style: PoppinsBold.copyWith(fontSize: 20),  
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Contactcard(),
                  Contactcard(),
                  Contactcard(),
              
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
           
          ],
        ),
      ),
    );
  }
}
