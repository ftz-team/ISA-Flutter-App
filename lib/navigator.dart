import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/Screens/chatScreen.dart';
import 'package:isa_new/Screens/liveScreen.dart';
import 'package:isa_new/Screens/newsScreen.dart';
import 'package:isa_new/Screens/profileScreen.dart';

import 'UI/navbar.dart';

class IsaNavigator extends StatefulWidget{
  NavigatorState createState()=>NavigatorState();
}

class NavigatorState extends State<IsaNavigator>{

  //List with all screens
  List<Widget> _pages = [
    newsScreen(),
    chatScreen(),
    profileScreen(),
    liveScreen()
  ];

  //Navigator controller
  PageController _navController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), onPressed: () {},),
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: NavItem("assets/images/navbarIcons/home.svg"),
                    width: displayWidth(context)*0.25,
                    height: displayHeight(context)*0.1,
                    margin: EdgeInsets.only(
                      left: displayWidth(context)*0
                    ),
                  ),
                  Container(
                    child: NavItem("assets/images/navbarIcons/chat.svg"),
                    width: displayWidth(context)*0.25,
                    margin: EdgeInsets.only(
                        right: displayWidth(context)*0
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 NavItem("assets/images/navbarIcons/profile.svg"),
                 NavItem("assets/images/navbarIcons/clock.svg"),
               ],
             ),
            )
          ],
        ),
      ),
      body: PageView(
        controller: _navController,
        onPageChanged: (int){

        },
        children: _pages,
      ),
    );
  }
}