import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
// import 'package:safespace/Screens/Authentication/Forgetpassword.dart';
import 'package:safespace/Screens/Authentication/ResetPassword.dart';
import 'package:safespace/Screens/Authentication/Signup.dart';
import 'package:safespace/Screens/navigatorScreen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/logo_NB.png",
                      fit: BoxFit.fill, width: 90)),
              SizedBox(
                height: 40,
              ),
              Text(
                "Welcome Back!",
                style: PoppinsBold.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please enter your details to stay safe!",
                style: Poppins,
              ),
              SizedBox(
                height: 20,
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
                height: 30,
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
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Remember me",
                    style: Poppins.copyWith(fontSize: 12),
                  ),
                  Spacer(),
                  TextButton(onPressed:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                  }, child:  Text(
                    "Forgot Password?",
                    style: PoppinsBold.copyWith(fontSize: 12,color: Colors.red),
                  ),)
                 
                  
                ],
              ),
               SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Navigatorscreen()), (route) => false);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 90),
                              child: Text(
                                "Log In",
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(thickness: 2,height: 10,),
                          Text("or"),
                          Divider(thickness: 2,),
                        ],
                      ),
                        SizedBox(
                        height: 20,
                      ),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xff1877F2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.facebook,color: Colors.white,),
                                  // Text("Facebook",style: PoppinsBold.copyWith(color: Colors.white),),
                                  // SizedBox(width: 6,),
                            
                                ],
                              ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(40),
                              color:Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ClipRRect (borderRadius: BorderRadius.circular(40), child: Image.asset("assets/images/googleLogo.jpg",width: 34,))
                                  // Text("Google",style: PoppinsBold.copyWith(color: Colors.grey),),
                                  // SizedBox(width: 6,),
                            
                                ],
                              ),
                          ),
                        ],
                      ),
                  
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                       
                       
                          Text("Don't have an account?",style: PoppinsBold.copyWith(color: Colors.grey),),
                          TextButton(onPressed: (){
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
                          }, child: Text("Sign up",style: PoppinsBold.copyWith(color: Hgreen),),),
                        ],
                      )
            ],
          ),
        ),
      ),
    );
  }
}
