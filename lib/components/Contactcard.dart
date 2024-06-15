
import 'package:flutter/material.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Emergency.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Emergency()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          width: 100,
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              Text(
                "fire Rescue",
                style: PoppinsBold.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}