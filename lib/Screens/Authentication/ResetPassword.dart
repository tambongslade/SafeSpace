import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Authentication/emailvef.dart';
// import 'package:safespace/Screens/Authentication/Otppage.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reset Password',
                    style: PoppinsBold.copyWith(fontSize: 30, color: Hgreen),
                  ),
                  SizedBox(height: 10),
                  Text(
                      'Please enter your email address to request a password reset'),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Email",
                      style: Poppins.copyWith(fontSize: 12),
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35)),
                      hintText: 'Example@gmail.com',
                      hintStyle: Poppins.copyWith(fontSize: 13),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Emailvef()));
                  // Handle password reset logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Use your desired color
                  minimumSize:
                      Size(double.infinity, 50), // Make button full width
                ),
                child: Text(
                  'Send Reset Password',
                  style: Poppins.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigate back to login screen
                },
                child: Text(
                  "You remembered your password? Login",
                  style: TextStyle(color: Colors.teal),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
