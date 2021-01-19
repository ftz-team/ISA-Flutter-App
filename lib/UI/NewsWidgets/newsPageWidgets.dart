import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
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