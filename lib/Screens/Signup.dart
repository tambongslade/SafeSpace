import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Login.dart';
import 'package:safespace/Screens/navigatorScreen.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.help_outline_sharp,
                    color: Red_color,
                  ),
                  Text(
                    "Get Help",
                    style: gethelp,
                  )
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.center, child: Container( child: Image.asset("assets/images/logo_NB.png",fit: BoxFit.fill,width:90))),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create your Account",
                        style: PoppinsBold.copyWith(fontSize: 20),
                      ),
                      Text(
                        "Please enter your details to continue",
                        style: Poppins,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Email",
                        style: PoppinsBold.copyWith(fontSize: 12),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Example@gmail.com",
                          hintStyle: Poppins.copyWith(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Name",
                        style: PoppinsBold.copyWith(fontSize: 12),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your Name",
                          hintStyle: Poppins.copyWith(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
                        style: PoppinsBold.copyWith(fontSize: 12),
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: "Enter your Password",
                          hintStyle: Poppins.copyWith(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Confirm password",
                        style: PoppinsBold.copyWith(fontSize: 12),
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintText: "Enter your Password",
                          hintStyle: Poppins.copyWith(fontSize: 12),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                            style: Poppins.copyWith(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "By signing up, you agree to our ",
                                  style: Poppins.copyWith(fontSize: 12)),
                              TextSpan(
                                  text: "Terms of Service",
                                  style: PoppinsBold.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                      color: Colors.orange)),
                              TextSpan(
                                  text: " and ",
                                  style: Poppins.copyWith(fontSize: 12)),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: PoppinsBold.copyWith(
                                      decoration: TextDecoration.underline,
                                      fontSize: 12,
                                      color: Colors.orange)),
                            ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Navigatorscreen()));

                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 90),
                              child: Text(
                                "Sign up",
                                style: PoppinsBold.copyWith(fontSize: 13,color: Colors.white),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Hgreen,
                              padding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 160,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff1877F2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.facebook,color: Colors.white,),
                                  Text("Facebook",style: PoppinsBold.copyWith(color: Colors.white),),
                                  SizedBox(width: 6,),
                            
                                ],
                              ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            width: 160,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color:Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.g_mobiledata,color: Colors.white,),
                                  Text("Google",style: PoppinsBold.copyWith(color: Colors.grey),),
                                  SizedBox(width: 6,),
                            
                                ],
                              ),
                          ),
                        ],
                      ),
                  
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       
                       
                          Text("Already have an account?",style: PoppinsBold.copyWith(color: Colors.grey),),
                          TextButton(onPressed: (){
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                          }, child: Text("Login",style: PoppinsBold.copyWith(color: Hgreen),),),
                        ],
                      )
                      
                    ]),
                
              ],
            ),
          ),
        ));
  }
}
