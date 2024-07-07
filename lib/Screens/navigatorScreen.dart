

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Constants/color.dart';

import 'package:safespace/Constants/styles.dart';
import 'package:safespace/Screens/help.dart';
import 'package:safespace/Screens/home.dart';
import 'package:safespace/Screens/maps.dart';
import 'package:safespace/Screens/setting.dart';
import 'package:safespace/Screens/tips.dart';
import 'package:safespace/firebase_auth_implementation/firebase_auth_services.dart';

class Navigatorscreen extends StatefulWidget {
 late String userid;
 Navigatorscreen({super.key});
//  final String userid;

  @override
  State<Navigatorscreen> createState() => _NavigatorscreenState();
}

class _NavigatorscreenState extends State<Navigatorscreen> {
    @override
  void initState() {
    super.initState();
    _fetchUserName();
  }
  String? displayName;
  // final FirebaseAuthServices _authServices = FirebaseAuthServices();
  Future<void> _fetchUserName() async {
    // String? name = await _authServices.getDisplayName(widget.userid);
    setState(() {
      // displayName = name;
  
    });
  }
  

  
List <Widget> pages = [Home(), Maps(), Setting(),TipsPage()];
final Iconlist = <IconData>[Icons.home, Icons.map_outlined, Icons.settings_outlined, Icons.help_outline];
var title = ["Home","Maps","Settings","Help"];
int pageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: Iconlist.length,
        activeIndex: pageIndex,
        
        gapLocation: GapLocation.none,
        onTap: (index){
          setState(() {
            pageIndex=index;
          });

        },
        tabBuilder: (int index, bool isActive) {
          final Color color = isActive ? Hgreen : Colors.black;
          return Column(
            children: [
              Icon(
                Iconlist[index],
                size: 26,
                color: color,
              ),
                            // const SizedBox(height: 4),
                            Padding(padding:EdgeInsets.only(left: 5),
                            child: AutoSizeText(
                              title[index],
                              maxLines: 1,
                              style: Poppins.copyWith(color: Colors.black),
                            ),)
                    

            ],
          );
        },
        
        
     
     ) );
  }
}