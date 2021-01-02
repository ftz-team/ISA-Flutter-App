import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';

class NavItem extends StatelessWidget{
  String asset;
  NavItem(this.asset);
  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(
      asset,
      width: displayWidth(context)*0.05,
      height: displayHeight(context)*0.03,
    );
  }
}
