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
