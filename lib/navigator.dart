import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/Screens/liveScreen.dart';
import 'package:isa_new/Screens/profileScreen.dart';
import 'package:isa_new/UI/UI.dart' as UI;

import 'file:///D:/AndroidStudioProjects/isa_new/lib/Screens/ChatsScreens/chatScreen.dart';
import 'file:///D:/AndroidStudioProjects/isa_new/lib/Screens/NewsScreens/newsScreen.dart';
import 'file:///D:/AndroidStudioProjects/isa_new/lib/Screens/TimeTableScreens/timeTableScreen.dart';

import 'UI/navbar.dart';

class IsaNavigator extends StatefulWidget {
  NavigatorState createState() => NavigatorState();
}

class NavigatorState extends State<IsaNavigator> with TickerProviderStateMixin {
  bool opened = false;
  int active = 0;
  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  AnimationController _navbarButtonsAnimationController;
  Animation<Offset> navbarButtonsAnimationoffset;

  //List with all screens
  List<Widget> _pages = [
    newsScreen(),
    chatScreen(),
    profileScreen(),
    liveScreen(),
    timeTableScreen()
  ];

  void toogleOpened() {
    if (opened) {
      _navbarButtonsAnimationController.reverse();
      _arrowAnimationController.reverse();
    } else {
      _navbarButtonsAnimationController.forward();
      _arrowAnimationController.forward();
    }
    setState(() {
      opened = !opened;
    });
  }

  @override
  void initState() {
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    _navbarButtonsAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    navbarButtonsAnimationoffset = Tween<Offset>(begin: Offset(0.0, 1.0), end:Offset.zero )
        .animate(_navbarButtonsAnimationController);
    super.initState();
  }

  //Navigator controller
  PageController navController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {

    return Stack(children: [
        Scaffold(
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedBuilder(
        animation: _arrowAnimationController,
        builder: (context, child) => Transform.rotate(
          angle: -_arrowAnimation.value,
          child: Container(
            width: displayWidth(context) * 0.175,
                  child: FloatingActionButton(
                    //FIXME use color from ui
                    backgroundColor: Color(0xffFFB73E),
                    child: !opened
                        ? const Icon(Icons.add)
                        : const Icon(Icons.remove),
                    onPressed: toogleOpened,
                  ),
                ),
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
                  GestureDetector(
                    onTap: (){
                      navController.jumpToPage(0);
                    },
                    child: 0!=active?NavItem("assets/images/navbarIcons/home.svg" , num: 1):NavItem.active("assets/images/navbarIcons/home.svg" , num: 1),
                  ),

                  GestureDetector(
                    onTap: () {
                      navController.jumpToPage(1);
                    },
                    child: 1 != active ? NavItem(
                        "assets/images/navbarIcons/chat.svg", num: 2) : NavItem
                        .active(
                        "assets/images/navbarIcons/chatActive.svg", num: 2),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      navController.jumpToPage(2);
                    },
                    child: 2!=active?NavItem("assets/images/navbarIcons/profile.svg" , num: 3):NavItem.active("assets/images/navbarIcons/profile.svg" , num: 3),
                  ),
                  GestureDetector(
                    onTap: (){
                            navController.jumpToPage(3);
                          },
                          child: 3 != active
                              ? NavItem("assets/images/navbarIcons/clock.svg",
                                  num: 4)
                              : NavItem.active(
                                  "assets/images/navbarIcons/clock.svg",
                                  num: 4),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: Stack(overflow: Overflow.visible, children: [
              PageView(
                controller: navController,
                onPageChanged: (int) {
                  setState(() {
                    active = int;
                  });
                },
                children: _pages,
              ),

              active != 4
                  ? NavItemDropped(UI.icons.navSchedulte,
                  navbarButtonsAnimationoffset, 1, navController, 4,
                  toogleOpened)
                  : NavItemDropped.active(UI.icons.navSchedulte,
                  navbarButtonsAnimationoffset, 1, navController, 4,
                  toogleOpened),
              active != 5
                  ? NavItemDropped(UI.icons.navEventsIcon,
                  navbarButtonsAnimationoffset, 2, navController, 5,
                  toogleOpened)
                  : NavItemDropped.active(UI.icons.navEventsIcon,
                  navbarButtonsAnimationoffset, 2, navController, 5,
                  toogleOpened),
              active != 6
                  ? NavItemDropped(UI.icons.navEditIcon,
                  navbarButtonsAnimationoffset, 3, navController, 6,
                  toogleOpened)
                  : NavItemDropped.active(UI.icons.navEditIcon,
                  navbarButtonsAnimationoffset, 3, navController, 6,
                  toogleOpened),
            ])),


    ],);
  }
}