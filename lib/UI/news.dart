import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';

class newsDateText extends UIItem {
  String date;

  newsDateText(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        date,
        style: TextStyle(
            color: colors.disabled,
            fontFamily: font,
            fontSize: displayWidth(context) * 0.033,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class likeButton extends UIItem {
  String _asset;
  int cnt;

  likeButton(int cnt) {
    this._asset = icons.newsLikeButton;
    this.cnt = cnt;
  }

  likeButton.active() {
    this._asset = icons.newsLikeActiveButton;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: displayWidth(context) * 0.01),
          child: Text(
            cnt.toString(),
            style: TextStyle(
                color: colors.black,
                fontFamily: font,
                fontWeight: FontWeight.w500,
                fontSize: displayWidth(context) * 0.035),
          ),
        ),
        Container(
          child: SvgPicture.asset(
            _asset,
            width: displayWidth(context) * 0.07,
          ),
        )
      ],
    );
  }
}

class NewsTypeHeader extends UIItem {
  Color _textColor;
  String _text;

  NewsTypeHeader.petition() {
    this._textColor = colors.semiRed;
    this._text = "Петиция";
  }

  NewsTypeHeader.news() {
    this._textColor = colors.primary;
    this._text = "Новость";
  }

  NewsTypeHeader.poll() {
    this._textColor = colors.yellow;
    this._text = "Опрос";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _text,
        style: TextStyle(
            color: _textColor,
            fontFamily: font,
            fontSize: displayWidth(context) * 0.033,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class NewsHeaderText extends UIItem {
  final maxTextLen = 70;
  String _text;

  NewsHeaderText(String text) {
    if (text.length < maxTextLen) {
      this._text = text;
    } else {
      this._text = text.substring(0, maxTextLen) + "...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: displayWidth(context) * 0.005),
      child: Text(
        _text,
        style: TextStyle(
            color: colors.black,
            fontFamily: font,
            fontWeight: FontWeight.w600,
            fontSize: displayWidth(context) * 0.04),
      ),
    );
  }
}

class NewsCard extends UIItem {
  String asset =
      "https://storage.theoryandpractice.ru/tnp/uploads/image_unit/000/156/586/image/base_87716f252d.jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(displayWidth(context) * 0.02),
      margin: EdgeInsets.only(
        top: displayHeight(context) * 0.03,
        left: displayWidth(context) * 0.02,
        right: displayWidth(context) * 0.02,
      ),
      decoration: BoxDecoration(
        color: colors.newsCardBackground,
        borderRadius: BorderRadius.circular(displayWidth(context) * 0.02),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 4,
              child: Container(
                height: displayHeight(context) * 0.14,
                margin: EdgeInsets.only(right: displayWidth(context) * 0.02),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(displayWidth(context) * 0.02),
                  child: Image.network(
                    asset,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Expanded(
            flex: 11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsTypeHeader.news(),
                NewsHeaderText(
                    "Итоги недели иностранного языка «Новый год шагает по планете»"),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [newsDateText("2 часа назад"), likeButton(27)],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
