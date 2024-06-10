import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:safespace/Screens/help.dart';
import 'package:safespace/Screens/home.dart';
import 'package:safespace/Screens/maps.dart';
import 'package:safespace/Screens/setting.dart';

class Navigatorscreen extends StatefulWidget {
  const Navigatorscreen({super.key});

  @override
  State<Navigatorscreen> createState() => _NavigatorscreenState();
}

class _NavigatorscreenState extends State<Navigatorscreen> {
  
List <Widget> pages = [Home(), Maps(), Setting(),Help()];
int pageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [Icons.home, Icons.map, Icons.settings, Icons.help],
        activeIndex: pageIndex,
        gapLocation: GapLocation.none,
 
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}