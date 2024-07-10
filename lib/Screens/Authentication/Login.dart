import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Authentication/ResetPassword.dart';
import 'package:safespace/Screens/Authentication/Signup.dart';
import 'package:safespace/Screens/Authentication/provider.dart';
import 'package:safespace/Screens/navigatorScreen.dart';
import 'package:safespace/components/snack_bar.dart';
// import 'package:safespace/providers/user_provider.dart';

final _formkey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? validateEmail(String? email) {
    RegExp emailregex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = emailregex.hasMatch(email ?? '');
    if (!isValid) {
      return 'Enter Valid Email';
    }
    return null;
  }

  bool isVisible = false;
  IconData iconData = Icons.visibility_off;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    print("LOgin Button Pressed");
    if (_formkey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      try {
        final response = await http.post(
          Uri.parse('http://192.168.1.177:3000/user/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }),
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseBody = jsonDecode(response.body);
          final String token = responseBody['token'];
          final String id = responseBody['id'];
          final String name = responseBody['name'];

          // Store the token, id, and name in UserProvider
          Provider.of<UserProvider>(context, listen: false).setUser(token, id, name);

          // Navigate to the home screen
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigatorscreen()));
        } else {
          final error = jsonDecode(response.body)['message'];
          showSnackbar(context, 'Login failed: $error');
        }
      } catch (e) {
        showSnackbar(context, 'An error occurred: ${e.toString()}');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.help_outline_sharp, color: Red_color),
                Text("Get Help", style: gethelp),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/logo_NB.png", fit: BoxFit.fill, width: 90),
                ),
                SizedBox(height: 40),
                Text("Welcome Back!", style: PoppinsBold.copyWith(fontSize: 20)),
                SizedBox(height: 10),
                Text("Please enter your details to stay safe!", style: Poppins),
                SizedBox(height: 20),
                Text("Email", style: PoppinsBold.copyWith(fontSize: 12)),
                TextFormField(
                  controller: emailController,
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
                  validator: validateEmail,
                ),
                SizedBox(height: 30),
                Text("Password", style: PoppinsBold.copyWith(fontSize: 12)),
                TextFormField(
                  controller: passwordController,
                  obscureText: isVisible,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(iconData),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                          iconData = isVisible ? Icons.visibility : Icons.visibility_off;
                        });
                      },
                    ),
                    hintText: "Enter your Password",
                    hintStyle: Poppins.copyWith(fontSize: 12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Password';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text("Remember me", style: Poppins.copyWith(fontSize: 12)),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
                      },
                      child: Text("Forgot Password?", style: PoppinsBold.copyWith(fontSize: 12, color: Colors.red)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: loginUser,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Text("Log In", style: PoppinsBold.copyWith(fontSize: 13, color: Colors.white)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Hgreen,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(thickness: 2, height: 10),
                    Text("or"),
                    Divider(thickness: 2),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff1877F2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.facebook, color: Colors.white),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset("assets/images/googleLogo.jpg", width: 34),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: PoppinsBold.copyWith(color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text("Sign up", style: PoppinsBold.copyWith(color: Hgreen)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
