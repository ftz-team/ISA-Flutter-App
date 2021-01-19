import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';

class backButton extends UIItem {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(
            top: displayHeight(context) * 0.02,
            bottom: displayHeight(context) * 0.03),
        alignment: Alignment.topLeft,
        child: SvgPicture.asset(ui.icons.backButton),
      ),
    );
  }
}
