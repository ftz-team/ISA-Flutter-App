import 'package:flutter/material.dart';
import 'package:isa_new/UI/UI.dart';

class newsComments extends UIItem {
  int flexxer = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexxer,
        child: Text(
          "PIZZDA",
          style: UITypography.h1(context),
        ));
  }
}
