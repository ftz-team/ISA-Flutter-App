import 'package:flutter/material.dart';

class UI{
  final String font = "";
  final UIColors UIcolors = UIColors();

}

class UIColors{
  final primary = Color(0xff2f8add);
  final black = Colors.black;
  final yellow = Color(0xffFFB73E);
}

abstract class UIItem extends StatelessWidget with UI{

  @override
  UIColors get UIcolors => super.UIcolors;

  @override
  String get font => super.font;


}