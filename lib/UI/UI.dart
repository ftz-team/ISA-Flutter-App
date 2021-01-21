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
}

class UIIcons {
  //class with links to icons assets
  final String navEditIcon = "assets/images/navbarIcons/edit.svg";
  final String navEventsIcon = "assets/images/navbarIcons/events.svg";
  final String navSchedulte = "assets/images/navbarIcons/schedule.svg";
  final String newsLikeButton = "assets/images/newsIcons/like.svg";
  final String newsLikeActiveButton = "assets/images/newsIcons/likeActive.svg";
  final String backButton = "assets/images/backButton.svg";
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
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: font,
          color: UIColors.black

      ),
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

  PageWithTabs(this.tabsNames, this.tabs, this.header);

  PageWithTabsState createState() => PageWithTabsState(tabsNames, tabs, header);
}

class PageWithTabsState extends State<PageWithTabs>
    with SingleTickerProviderStateMixin {

  TabController _controller;
  int activeTab = 0;
  String header;

  PageWithTabsState(this._tabsNames, this._tabs, this.header);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Scaffold(
            backgroundColor: UIColors.defaultBackground,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: AppBarTextHeader(header),
              bottom: TabBar(
                controller: _controller,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: displayHeight(context) * 0.005,
                      color: UIColors.primary),
                  insets: EdgeInsets.symmetric(
                      horizontal: displayWidth(context) * 0.05),


                ),
                tabs: [
                  for(var i = 0; i < _tabsNames.length; i++) activeTab == i
                      ? TabBarTabItem(_tabsNames[i])
                      : TabBarTabItem.disabled(_tabsNames[i])
                ],
              ),
            ),
            body: TabBarView(
              controller: _controller,
              children: [
                for (var i in _tabs) i
              ],
            ),
          )),
    );
    ;
  }
}