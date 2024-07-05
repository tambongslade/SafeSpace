import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Authentication/Login.dart';
import 'package:safespace/Screens/Authentication/Otppage.dart';
import 'package:safespace/Screens/navigatorScreen.dart';
import 'package:safespace/components/snack_bar.dart';
import 'package:safespace/firebase_auth_implementation/firebase_auth_services.dart';
// import 'package:safespace/Screens/navigatorScreen.dart';

final _formkey = GlobalKey<FormState>();
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
// final FirebaseAuthServices _auth = FirebaseAuthServices(); 

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  String? validateEmail(String? Email) {
    RegExp emailregex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = emailregex.hasMatch(Email ?? '');
    if (!isValid) {
      return 'Enter Valid Email';
    }
    return null;
  }

    void signupUser() async {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Navigatorscreen()));
    // if (_formkey.currentState!.validate()) { // Validate form first
    //   setState(() {
    //     isLoading = true; 
    //   });

    //   try {
    //     String res = await _auth.signUpUser(
    //         email.text, password.text, name.text);
    //     setState(() {
    //       isLoading = false; 
    //     });

    //     if (res == "Success") {
    //       Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (context) => Navigatorscreen(userid:FirebaseAuth.instance.currentUser!.uid)));
    //     } else {
    //       showSnackbar(context, res); // Display error from Firebase
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     setState(() {
    //       isLoading = false; 
    //     });
    //     if (e.code == 'weak-password') {
    //       showSnackbar(context, 'The password provided is too weak.');
    //     } else if (e.code == 'email-already-in-use') {
    //       showSnackbar(context, 'The account already exists for that email.');
    //     } else {
    //       showSnackbar(context, 'Error: ${e.message}'); // Generic error
    //     }
    //   } catch (e) {
    //     setState(() {
    //       isLoading = false; 
    //     });
    //     showSnackbar(context, 'An error occurred. Please try again later.');
    //   }
    // }
    }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    name.dispose();
    email.dispose();
    password.dispose();
  }
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
                    style: gethelp.copyWith(fontSize: 12),
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
                Align(alignment: Alignment.center, child: Container( child: Image.asset("assets/images/logo_NB.png",fit: BoxFit.fill,width:80))),
                Form(
                  key: _formkey,
                  child: Column(
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
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
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
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              showSnackbar(context, "Enter Email");
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Name",
                          style: PoppinsBold.copyWith(fontSize: 12),
                        ),
                        TextFormField(
                          controller: name,
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
                          validator: (Value){
                            if(name.text.length<3){
                              showSnackbar(context, "Name should be atleast 3 characters");
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Password",
                          style: PoppinsBold.copyWith(fontSize: 12),
                        ),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          obscuringCharacter: "*",
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          validator: (value) {
                            if(email.text.length<6){
                              showSnackbar(context, "Password should be atleast 6 characters");
                            }else{
                              return null;
                            }
                          },
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
                                    style: Poppins.copyWith(fontSize: 11,)),
                                TextSpan(
                                    text: "Terms of Service",
                                    style: PoppinsBold.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontSize: 11,
                                        color: Colors.orange)),
                                TextSpan(
                                    text: " and ",
                                    style: Poppins.copyWith(fontSize: 11)),
                                TextSpan(
                                    text: "Privacy Policy",
                                    style: PoppinsBold.copyWith(
                                        decoration: TextDecoration.underline,
                                        fontSize: 11,
                                        color: Colors.orange)),
                              ]),
                        ),
                        const SizedBox(
                          height:20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                              onPressed:signupUser,
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
                         
                         
                            Text("Already have an account?",style: PoppinsBold.copyWith(color: Colors.grey),),
                            TextButton(onPressed: (){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                            }, child: Text("Login",style: PoppinsBold.copyWith(color: Hgreen),),),
                          ],
                        )
                        
                      ]),
                ),
                
              ],
            ),
          ),
        ));
  }
}
