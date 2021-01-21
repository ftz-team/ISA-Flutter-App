import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/NewsWidgets/news.dart';
import 'package:isa_new/UI/UI.dart';

class newsPageAuthorImage extends UIItem {
  String asset;

  newsPageAuthorImage(this.asset);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(displayWidth(context) * 0.012),
        child: Image.network(
          asset,
          fit: BoxFit.fitHeight,
          height: displayHeight(context) * 0.09,
          width: displayWidth(context) * 0.15,
        ),
      ),
    );
  }
}

class newsPageAuthorName extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class newsPageLikeButton extends UIItem {
  bool liked;
  int likes;
  int newsId;

  newsPageLikeButton(this.likes, this.liked, this.newsId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(top: displayHeight(context) * 0.01),
              constraints: BoxConstraints(
                  minWidth: displayWidth(context) * 0.15,
                  minHeight: displayHeight(context) * 0.045),
              decoration: BoxDecoration(
                  color: UIColors.likeBackground,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      likes.toString(),
                      style: UITypography.h4(context, weight: FontWeight.w500),
                    ),
                    margin: EdgeInsets.only(
                        left: displayWidth(context) * 0.03,
                        right: displayWidth(context) * 0.02),
                  ),
                  Container(
                    child: liked ? likeIcon.active() : likeIcon(),
                    margin:
                        EdgeInsets.only(right: displayWidth(context) * 0.03),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class SingleNewsHeader extends UIItem {
  String text;

  SingleNewsHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: displayHeight(context) * 0.02),
      child: Text(
        text,
        style: UITypography.h1(context),
      ),
    );
  }
}

class SingleNewsImage extends UIItem {
  Image image;

  SingleNewsImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: displayHeight(context) * 0.23),
      margin: EdgeInsets.only(top: displayHeight(context) * 0.015),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(displayWidth(context) * 0.02),
          child: image),
    );
  }
}

class SingleNewsText extends UIItem {
  String text;

  SingleNewsText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: UITypography.h3(context, weight: FontWeight.w400),
        textAlign: TextAlign.left,
      ),
    );
  }
}