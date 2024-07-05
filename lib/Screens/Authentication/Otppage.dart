import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/navigatorScreen.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // Store OTP input values
  List<String> otpDigits = List.filled(4, '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'OTP',
                style: PoppinsBold.copyWith(fontSize: 30, color: Hgreen),
              ),
              SizedBox(height: 10),
              Text('Please enter the OTP sent to your email'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(4, (index) => _buildOTPDigitField(index)),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Navigatorscreen()));

                  // Handle OTP verification logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                ),
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text("Didn't receive OTP?"),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text("Resend code ",
                        style: TextStyle(color: Colors.teal)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPDigitField(int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            otpDigits[index] = value;
          });

          // Auto-move focus to next field
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          counterText: '', // Hide character count
          border: InputBorder.none,
        ),
      ),
    );
  }
}
