import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/styles.dart';

class Emergency extends StatefulWidget {
  const Emergency({super.key});

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Text("Emergency",style:PoppinsBold.copyWith(fontSize: 30) ,),
            SizedBox(height: 20,),
            // Image(image: AssetImage("assets\images\firefighter.jpg")),
            Text("Contact Fire Fighters",style: PoppinsBold.copyWith(fontSize: 20),),
            SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Column(
                children: [
                    Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(600),
                    color: Colors.grey.shade300

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.call,size: 80,),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Local Calls",style: Poppins.copyWith(fontSize: 20),)
                ],
              ), Column(
                children: [
                    Container(
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(600),
                    color: Colors.grey.shade300

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.mobile_off_outlined,size: 80,),
                  ),
                ),
                SizedBox(height: 20,),
                Text("Online Call",style: Poppins.copyWith(fontSize: 20),)
                ],
              ),
              ],
            )
          ],
        ),
      ) ,
    );
  }
}