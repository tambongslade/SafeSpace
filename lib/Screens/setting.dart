import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';
import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/Authentication/Signup.dart';
import 'package:safespace/Screens/ProfilePage.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
    bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Hgreen,
        title: Text("Settings",style: PoppinsBold.copyWith(fontSize: 14),),
      ),
      body: ListView(
        
        children: [
        SwitchListTile(
          title: Text("Enable Notifications"),
          value: _notificationsEnabled,
          onChanged: (bool value){
            setState(() {
              _notificationsEnabled=!_notificationsEnabled;
            });
          },
          secondary: Icon(CupertinoIcons.bell),
        ),
        SizedBox(height: 10,),
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SafeSpaceProfilePage()));
          },
          leading: Icon(Icons.person),
          title: Text("Profile",style: Poppins,),
          trailing: Icon(Icons.arrow_forward),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/1.7,),
        
        ListTile(
          onTap:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));
          },
          iconColor: Red_color,
          title: Text("Logout"),
          leading: Icon(Icons.logout),
        )
      ],),
    );
  }
}