import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Authentication/Login.dart';
import 'package:safespace/Screens/navigatorScreen.dart';

class Newpassword extends StatefulWidget {
  const Newpassword({super.key});

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
    final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Enter your New Password',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Hgreen),
          ),
          SizedBox(height: 10),
          Text(
            'We have sent a reset password',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _newPasswordController,
            decoration: InputDecoration(
              hintText: 'New Password',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide( color: Hgreen),
              )
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide( color: Hgreen),
              )
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Navigatorscreen(userid:FirebaseAuth.instance.currentUser!.uid)));
              },
              child: Text('Confirm',style: Poppins.copyWith(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()));
              },
              child: Text('You remembered your password? Login'),
            ),
          ),
        ],
            ),
      ),
    );
  }
}