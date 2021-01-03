import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/Screens/chatScreen.dart';
import 'package:isa_new/Screens/liveScreen.dart';
import 'package:isa_new/Screens/newsScreen.dart';
import 'package:isa_new/Screens/profileScreen.dart';
import 'package:isa_new/UI/UI.dart';

import 'UI/navbar.dart';

class   IsaNavigator extends StatefulWidget{
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

  @override
  void initState(){
    super.initState();
  }

  //Navigator controller
  PageController _navController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        //FIXME use color from ui
        backgroundColor: Color(0xffFFB73E),
        child: const Icon(Icons.add), onPressed: () {},),
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        notchMargin: displayWidth(context)*0.03,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavItem.active("assets/images/navbarIcons/home.svg" , num: 1),
                  NavItem("assets/images/navbarIcons/chat.svg" , num: 2),
                ],
              ),
            ),
            Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 NavItem("assets/images/navbarIcons/profile.svg" , num: 3),
                 NavItem("assets/images/navbarIcons/clock.svg" , num: 4),
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