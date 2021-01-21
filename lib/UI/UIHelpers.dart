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
        alignment: Alignment.topLeft,
        child: SvgPicture.asset(ui.icons.backButton),
      ),
    );
  }
}

class bottomPanel extends UIItem {
  Widget child;

  bottomPanel(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.1,
      width: displayWidth(context),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: UIColors.defaultBackground,
      ),
      child: child,
    );
  }
}