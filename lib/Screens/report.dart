// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/navigatorScreen.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
String Dropdowntext = "Flood";
  @override
    
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Hgreen,
        title: Text("Report an Incident",style: Poppins.copyWith(fontSize: 16),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.report_outlined,size: 100,color: Colors.red,),
                  SizedBox(height: 10,),
                  Text("Please provide the following information!",style: PoppinsBold.copyWith(fontSize: 15),),
                  SizedBox(height: 30,),
                  Text("Type of Disaster",style: PoppinsBold.copyWith(fontSize: 15),)
         ,               DropdownButton(
                    value: Dropdowntext,
                    items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                        child: Text("Flood",style: Poppins,),
                        value: "Flood",
                      ),
                      DropdownMenuItem(
                        child: Text("Accident",style: Poppins,),
                        value: "Accident",
                      ),
                      DropdownMenuItem(
                        child: Text("Fire",style: Poppins,),
                        value: "Fire",
                      ),
                      DropdownMenuItem(
                        child: Text("Emergency",style: Poppins,),
                        value: "Emergency",
                      ),
                      DropdownMenuItem(
                        child: Text("Missing",style: Poppins,),
                        value:"Missing" ,
                  )],
                  icon: Icon(Icons.expand_more_outlined),
                   onChanged: (value) => setState(() {
                      Dropdowntext = value.toString();
                    }),),
                  SizedBox(height: 30,),
                  Align(alignment: Alignment.topLeft, child: Text("Location",style: PoppinsBold.copyWith(fontSize: 15),)),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        suffixIcon:IconButton(onPressed: () {}, icon: Icon(Icons.location_on_outlined),),
                        
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(alignment: Alignment.topLeft, child: Text("Description",style: PoppinsBold.copyWith(fontSize: 15),)),
              
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/15,
                    child: TextField(
                      
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)

                      
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Align(alignment: Alignment.topLeft, child: Text("Image",style: PoppinsBold,)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/15,
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.attach_file_outlined)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300
                    ),
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Navigatorscreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width ,
                      height: 100,
                      decoration: BoxDecoration(  
                        borderRadius: BorderRadius.circular(10),
                        color: Hgreen,
                        boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5)]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Send Report",style: PoppinsBold.copyWith(fontSize: 20,color: Colors.white),),
                         SizedBox(width: 10,),
                          Icon(Icons.arrow_forward_outlined,color: Colors.white,)
                        ],
                      ),
                    ),
                  )
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}