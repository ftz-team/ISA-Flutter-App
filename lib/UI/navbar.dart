import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';

class NavItem extends UIItem{

  String asset;
  Color color;
  Widget item;
  double height;
  double width;
  double marginLeft;
  double marginRight;
  double marginTop;
  double marginBottom;

  void setMargins(int num){
    if (num == 1){
      marginLeft = 0.05;
      marginBottom = 0.05;
      marginTop = 0.025;
      marginRight = 0;
    }else if (num == 2){
      marginLeft = 0;
      marginBottom = 0.05;
      marginTop = 0.025;
      marginRight = 0.12;
    }else if (num == 3){
      marginLeft = 0.12;
      marginBottom = 0.05;
      marginTop = 0.025;
      marginRight = 0;
    }else {
      marginLeft = 0;
      marginBottom = 0.05;
      marginTop = 0.025;
      marginRight = 0.05;
    }
  }

  NavItem(String asset,{int num = 1}){
    this.asset = asset;
    color = UIcolors.black;
    setMargins(num);
  }
  NavItem.active(String asset,{int num = 1}){
    this.asset = asset;
    color = UIcolors.primary;
    setMargins(num);
  }

  @override
  Widget build(BuildContext context) {
    return
    Container(
      width: displayWidth(context)*0.15,
      height: displayHeight(context)*0.035,
      margin: EdgeInsets.only(
          left: displayWidth(context) * marginLeft,
          bottom: displayHeight(context) * marginBottom,
          top: displayHeight(context) * marginTop,
          right: displayWidth(context) * marginRight
      ),
      child: SvgPicture.asset(
        asset,
        width: displayWidth(context)*0.05,
        height: displayHeight(context)*0.03,
        color: color,
      ),
    );

  }
}

class NavItemDropped extends UIItem{
  String asset;
  PageController _pageController;
  Animation<Offset> controller;
  int num;
  int page;
  Color iconColor = Colors.black;
  double leftMargin;
  double bottomMargin;
  NavItemDropped(String asset,Animation<Offset> controller,int num,PageController pageController,int pageJumpTo){
    this.asset = asset;
    this.controller = controller;
    this.page = pageJumpTo;
    this._pageController = _pageController;
    setMargins(num);
  }
  NavItemDropped.active(String asset,Animation<Offset> controller,int num,PageController pageController,int pageJumpTo){
    this.asset = asset;
    this.controller = controller;
    this.page = pageJumpTo;
    this._pageController = _pageController;
    this.iconColor = UIcolors.primary;
    setMargins(num);
  }

  setMargins(int num){
    if(num == 1){
      this.leftMargin = 0.28;
      this.bottomMargin = 0;
    }else if (num == 2){
      this.leftMargin = 0.435;
      this.bottomMargin = 0.025;
    }else if (num == 3){
      this.leftMargin = 0.59;
      this.bottomMargin = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Positioned(
          bottom: displayHeight(context)*bottomMargin,
          left: displayWidth(context)*leftMargin,
          child:   GestureDetector(
              onTap: (){
                print(0);
                print(page);
                _pageController.jumpToPage(page);
              },
              child:
          SlideTransition(
            position: controller,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: displayHeight(context)*0.135,
              ),
              child:    Stack(
                  children: [
                    Container(
                      width: displayWidth(context)*0.12,
                      height: displayWidth(context)*0.12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]
                      ),
                    ),
                    Positioned(
                      left: displayWidth(context)*0.03,
                      top: displayWidth(context)*0.03,
                      child: SvgPicture.asset(
                        asset,
                        width: displayWidth(context)*0.06,
                        color: iconColor,
                      ),
                    )
                  ],
                ),

            ),
          ),
          )
        );




  }

}