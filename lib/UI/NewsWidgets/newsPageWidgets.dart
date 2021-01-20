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
          fit: BoxFit.fill,
          height: displayHeight(context) * 0.09,
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
                      "27",
                      style: UITypography.h4(context),
                    ),
                    margin: EdgeInsets.only(
                        left: displayWidth(context) * 0.03,
                        right: displayWidth(context) * 0.02),
                  ),
                  Container(
                    child: likeIcon.active(),
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