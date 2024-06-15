import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Screens/Authentication/Signup.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset("assets/images/police.png")),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                    text: "Safe Space",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3AB091))),
              ]),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width / 1,
              child: Text(
                "Your relaible companiion for real time alerts and safety tips during natural disasters. Stay safe with us.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
                      },
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        iconColor: green,
                        backgroundColor: Hgreen,
                        padding: EdgeInsets.all(20),
                        shape: CircleBorder(),
                        minimumSize: Size(50, 50),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
