import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';

class UI{
  final String font = "Montserrat";
  final UIColors UIcolors = UIColors();
  final UIIcons icons = UIIcons();
}

class UIColors {
  static const primary = Color(0xff2f8add);
  static const black = Colors.black;
  static const yellow = Color(0xffFFB73E);
  static const disabled = Color(0xffA8A7A7);
  static const semiRed = Color(0xffFF5D5D);
  static const red = Color(0xffFF003A);
  static const defaultBackground = Color(0xffF9F9F9);
  static const newsCardBackground = Color(0xffFEFEFE);
  static const likeBackground = Color(0xffffe7dc);
  static const semiBlue = Color(0xffC9E8FF);
  static const semiYellow = Color(0xffFFEACD);
  static const background = Color(0xffF9F9F9);
}

class UIIcons {
  //class with links to icons assets
  final String navEditIcon = "assets/images/navbarIcons/edit.svg";
  final String navEventsIcon = "assets/images/navbarIcons/events.svg";
  final String navSchedulte = "assets/images/navbarIcons/schedule.svg";
  final String newsLikeButton = "assets/images/newsIcons/like.svg";
  final String newsLikeActiveButton = "assets/images/newsIcons/likeActive.svg";
  final String backButton = "assets/images/backButton.svg";
  final String cancelButton = "assets/images/cancel.svg";
  final String plusButton = "assets/images/plus.svg";
}

class UITypography {
  // H1 - Figma 20px font
  static TextStyle h1(BuildContext context, [Color color = UIColors.black]) {
    return TextStyle(
        color: color,
        fontFamily: ui.font,
        fontWeight: FontWeight.w700,
        fontSize: displayWidth(context) * 0.055,
        height: displayHeight(context) * 0.002);
  }

  //H2 - Figma 18px font
  static TextStyle h2(BuildContext context, [Color color = UIColors.black]) {
    return TextStyle(
        color: color,
        fontFamily: ui.font,
        fontWeight: FontWeight.w700,
        fontSize: displayWidth(context) * 0.045);
  }

  static TextStyle Figma16px(BuildContext context,
      {Color color = UIColors.black, FontWeight weight = FontWeight.w700}) {
    return TextStyle(
        color: color,
        fontFamily: ui.font,
        fontWeight: weight,
        height: displayHeight(context) * 0.0023,
        fontSize: displayWidth(context) * 0.04);
  }

  //H3 - Figma 14px
  static TextStyle h3(BuildContext context,
      {Color color = UIColors.black, FontWeight weight = FontWeight.w700}) {
    return TextStyle(
        color: color,
        fontFamily: ui.font,
        fontWeight: weight,
        height: displayHeight(context) * 0.0023,
        fontSize: displayWidth(context) * 0.038);
  }

  //H4 - Figma 12px
  static TextStyle h4(BuildContext context,
      {Color color = UIColors.black, FontWeight weight = FontWeight.w400}) {
    return TextStyle(
        color: color,
        fontFamily: ui.font,
        fontWeight: weight,
        fontSize: displayWidth(context) * 0.032);
  }
}


abstract class UIItem extends StatelessWidget with UI {
  @override
  UIColors get colors => super.UIcolors;

  @override
  String get font => super.font;

  @override
  UIIcons get icons => super.icons;
}

final UI ui = UI();
final UIColors UIcolors = UIColors();
final UIIcons icons = UIIcons();


class AppBarTextHeader extends UIItem {
  String header;

  Color color;

  AppBarTextHeader(this.header);

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: UITypography.h1(context),
    );
  }
}

class TabBarTabItem extends UIItem {
  Color textColor;
  String text;
  FontWeight fontWeight;

  TabBarTabItem(String text) {
    this.text = text;
    this.textColor = UIColors.black;
    this.fontWeight = FontWeight.w600;
  }

  TabBarTabItem.disabled(String text){
    this.text = text;
    this.textColor = UIColors.disabled;
    this.fontWeight = FontWeight.w400;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: displayHeight(context) * 0.02,
          bottom: displayHeight(context) * 0.015
      ),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: font,
            fontWeight: fontWeight,
            color: textColor,
            fontSize: displayWidth(context) * 0.047
        ),
      ),
    );
  }
}


class PageWithTabs extends StatefulWidget {
  List<String> tabsNames;
  List<Widget> tabs;
  String header;
  Color underlineColor;

  PageWithTabs(this.tabsNames, this.tabs, this.header,
      {this.underlineColor = UIColors.primary});

  PageWithTabsState createState() =>
      PageWithTabsState(tabsNames, tabs, header, underlineColor);
}

class PageWithTabsState extends State<PageWithTabs>
    with SingleTickerProviderStateMixin {

  TabController _controller;
  int activeTab = 0;
  String header;
  Color underlineColor;

  PageWithTabsState(this._tabsNames, this._tabs, this.header,
      this.underlineColor);

  List<String> _tabsNames;
  List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabsNames.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        activeTab = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Scaffold(
            backgroundColor: UIColors.defaultBackground,
            appBar:
            PreferredSize(
              preferredSize: displaySize(context) * 0.1,
              child: AppBar(

                elevation: 0,
                backgroundColor: UIColors.defaultBackground,
                centerTitle: true,
                title: AppBarTextHeader(header),
                bottom: TabBar(
                  controller: _controller,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: displayHeight(context) * 0.005,
                        color: underlineColor
                    ),
                    insets: EdgeInsets.only(
                      bottom: displayHeight(context) * 0.005,
                      right: displayWidth(context) * 0.05,
                      left: displayWidth(context) * 0.05,
                    ),


                  ),
                  tabs: [
                    for(var i = 0; i < _tabsNames.length; i++) activeTab == i
                        ? TabBarTabItem(_tabsNames[i])
                        : TabBarTabItem.disabled(_tabsNames[i])
                  ],
                ),
              ),
            ),
        body: TabBarView(
          controller: _controller,
          children: [for (var i in _tabs) i],
        ),
      )),
    );
  }
}

class placeHolderMargin extends UIItem {
  double _height;
  double _width;
  double _maxWidth;
  double _maxHeight;

  placeHolderMargin(
      {double height = 1,
      double width = 1,
      double maxHeight = 1000,
      double maxWidth = 1000}) {
    this._height = height;
    this._width = width;
    this._maxWidth = maxWidth;
    this._maxHeight = maxHeight;
  }

  @override
  Widget build(BuildContext context) {
    return
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: _maxWidth, maxHeight: _maxHeight),
        child: Container(
          height: _height,
          width: _width,
        ),
      );
  }
}
