import 'dart:math';

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

class NavigatorState extends State<IsaNavigator> with TickerProviderStateMixin {

  bool opened = false;

  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  //List with all screens
  List<Widget> _pages = [
    newsScreen(),
    chatScreen(),
    profileScreen(),
    liveScreen()
  ];

  @override
  void initState() {

    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    super.initState();
  }

  //Navigator controller
  PageController _navController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedBuilder(
      animation: _arrowAnimationController,
      builder: (context, child) => Transform.rotate(
        angle: -_arrowAnimation.value,
        child: FloatingActionButton(
          //FIXME use color from ui
          backgroundColor: Color(0xffFFB73E),
          child: !opened?const Icon(Icons.add):const Icon(Icons.remove), onPressed: () {
            //print("rotating");
            if (opened){
              _arrowAnimationController.reverse();
            }else{
              _arrowAnimationController.forward();
            }
           setState(() {
             opened = !opened;
           });
        },),
      ),

    ),
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