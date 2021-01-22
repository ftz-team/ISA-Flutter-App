import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/Screens/NewsScreens/SingleNewsScreen.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/models/NewsModel.dart';

class newsDateText extends UIItem {
  String date;

  newsDateText(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        date,
        style: TextStyle(
            color: UIColors.disabled,
            fontFamily: font,
            fontSize: displayWidth(context) * 0.033,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

class likeIcon extends UIItem {
  String _asset;

  likeIcon() {
    this._asset = icons.newsLikeButton;
  }

  likeIcon.active() {
    this._asset = icons.newsLikeActiveButton;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _asset,
      width: displayWidth(context) * 0.055,
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

  likeButton.active(int cnt) {
    this.cnt = cnt;
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
                color: UIColors.black,
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
    this._textColor = UIColors.semiRed;
    this._text = "Петиция";
  }

  NewsTypeHeader.news() {
    this._textColor = UIColors.primary;
    this._text = "Новость";
  }

  NewsTypeHeader.poll() {
    this._textColor = UIColors.yellow;
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
  final maxTextLen = 80;
  String _text;

  NewsHeaderText(String text) {
    if (text.length < maxTextLen) {
      this._text = text + " " * (maxTextLen - text.length) + "";
      //FIXME
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
            color: UIColors.black,
            fontFamily: font,
            fontWeight: FontWeight.w600,
            fontSize: displayWidth(context) * 0.04),
      ),
    );
  }
}


class NewsCardInner extends UIItem {
  NewsModel NewsData;
  Function like;

  NewsCardInner(NewsData, like) {
    this.NewsData = NewsData;
    this.like = like;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleNewsScreen(NewsData.id)));
      },
      child: Container(
        padding: EdgeInsets.all(displayWidth(context) * 0.02),
        margin: EdgeInsets.only(
          top: displayHeight(context) * 0.03,
          left: displayWidth(context) * 0.02,
          right: displayWidth(context) * 0.02,
        ),
        decoration: BoxDecoration(
          color: UIColors.newsCardBackground,
          borderRadius: BorderRadius.circular(displayWidth(context) * 0.02),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.6,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
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
                    child: CachedNetworkImage(
                      imageUrl: NewsData.asset,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            Expanded(
              flex: 11,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewsData.type == "post"
                      ? NewsTypeHeader.news()
                      : NewsData.type == "poll"
                      ? NewsTypeHeader.poll()
                      : NewsTypeHeader.petition(),
                  NewsHeaderText(NewsData.header),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        newsDateText(NewsData.time),
                        GestureDetector(
                          child: NewsData.liked
                              ? likeButton.active(NewsData.likes)
                              : likeButton(NewsData.likes),
                          onTap: like,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
