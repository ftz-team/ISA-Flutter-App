import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';

class ChatCardDivider extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: displayHeight(context) * 0.015),
      decoration: BoxDecoration(color: Color(0xffE2E2E2)),
      width: displayWidth(context),
      height: displayHeight(context) * 0.0025,
    );
  }
}

class ChatCardDate extends UIItem {
  String text;

  ChatCardDate(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: displayHeight(context) * 0.02),
      child: Text(
        text,
        style: TextStyle(
            color: Color(0xff515151),
            fontSize: displayWidth(context) * 0.035,
            fontFamily: font,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class chatCardImage extends UIItem {
  String asset;

  chatCardImage(this.asset);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(displayWidth(context) * 0.12),
      child: Image.network(
        asset,
      ),
    );
  }
}

class chatCardHeader extends UIItem {
  String text;

  chatCardHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
          style: TextStyle(
              fontFamily: font,
              fontSize: displayWidth(context) * 0.04,
              color: Colors.black,
              fontWeight: FontWeight.w600)),
    );
  }
}

class chatCardLastMsg extends UIItem {
  String text;

  chatCardLastMsg(String text) {
    if (text.length > 37) {
      this.text = text.substring(0, 34) + "...";
    } else {
      this.text = text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: displayWidth(context) * 0.7,
        child: Text(
          text,
          style: UITypography.h4(context, weight: FontWeight.w500),
        ));
  }
}

class chatCardStatus extends UIItem {
  String asset;

  chatCardStatus(bool readed) {
    if (readed) {
      this.asset = "assets/images/chatIcons/readed.svg";
    } else {
      this.asset = "assets/images/chatIcons/not_readed.svg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        asset,
        width: displayWidth(context) * 0.035,
      ),
      width: displayWidth(context) * 0.055,
    );
  }
}
