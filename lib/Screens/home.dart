import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/report.dart';

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
      body: Column(
        children: [
          Text(
            "News",
            style: PoppinsBold.copyWith(fontSize: 20),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.8,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4.7,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  "assets/images/flood.jpeg",
                                  fit: BoxFit.cover,
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Buea :Floods victims begin Cleaning Operations",
                            style: PoppinsBold.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "2h ago",
                                style: PoppinsBold.copyWith(
                                    fontSize: 10, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "5 comments",
                                style: PoppinsBold.copyWith(
                                    fontSize: 10,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "Read more>>>  ",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "View All....",
                  style: PoppinsBold.copyWith(
                      fontSize: 12,
                      color: Hgreen,
                      decoration: TextDecoration.underline),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "What Do you Need?",
                style: PoppinsBold.copyWith(fontSize: 19),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF6600), // Orange background color
            // onPrimary: Colors.white, // Text color
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            // Handle button press here
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Report()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Text('Report an incident',style: Poppins.copyWith(fontSize: 18,color: Colors.white),),
          ),
                    ),
                      SizedBox(
            height: 20,
          ),
          ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Hgreen, // Orange background color
            // onPrimary: Colors.white, // Text color
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            // Handle button press here
            print('Button Pressed');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Text('Contact Emergency',style: Poppins.copyWith(fontSize: 18,color: Colors.white),),
          ),
                    ),
          
        ],
      ),
    );
  }
}
