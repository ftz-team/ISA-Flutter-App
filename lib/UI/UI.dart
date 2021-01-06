import 'package:flutter/material.dart';

class UI{
  final String font = "";
  final UIColors UIcolors = UIColors();
  final UIIcons icons = UIIcons();
}

class UIColors {
  final primary = Color(0xff2f8add);
  final black = Colors.black;
  final yellow = Color(0xffFFB73E);
}

class UIIcons {
  //class with links to icons assets
  final String navEditIcon = "assets/images/navbarIcons/edit.svg";
  final String navEventsIcon = "assets/images/navbarIcons/events.svg";
  final String navSchedulte = "assets/images/navbarIcons/schedule.svg";
}

abstract class UIItem extends StatelessWidget with UI {
  @override
  UIColors get UIcolors => super.UIcolors;

  @override
  String get font => super.font;

  @override
  UIIcons get icons => super.icons;
}

final UI ui = UI();
final UIColors UIcolors = UIColors();
final UIIcons icons = UIIcons();