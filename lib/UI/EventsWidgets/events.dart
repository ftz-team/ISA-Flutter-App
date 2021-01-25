import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/api/dateHelpers.dart';

class dayCard extends UIItem {
  DateTime date;
  FontWeight fontweight;
  Color background;
  bool shadow = false;

  dayCard(DateTime date) {
    this.fontweight = FontWeight.w400;
    this.background = UIColors.defaultBackground;
    this.date = date;
  }

  dayCard.selected(DateTime date) {
    this.fontweight = FontWeight.w600;
    this.background = Colors.white;
    this.date = date;
    shadow = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: displayWidth(context) * 0.0123,
          left: displayWidth(context) * 0.0123,
          bottom: displayHeight(context) * 0.02),
      decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(displayWidth(context) * 0.08),
          boxShadow: shadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]
              : null),
      width: displayWidth(context) * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: displayHeight(context) * 0.02,
            ),
            child: Text(
              date.day.toString(),
              style: UITypography.Figma16px(context, weight: fontweight),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: displayWidth(context) * 0.03),
            child: Text(
              shortDay(date.weekday),
              style: UITypography.Figma16px(context, weight: fontweight),
            ),
          ),
        ],
      ),
    );
  }
}
