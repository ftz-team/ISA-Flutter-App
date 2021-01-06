import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';

class UI{
  final String font = "Montserrat";
  final UIColors UIcolors = UIColors();
  final UIIcons icons = UIIcons();
}

class UIColors {
  final primary = Color(0xff2f8add);
  final black = Colors.black;
  final yellow = Color(0xffFFB73E);
  final disabled = Color(0xffA8A7A7);
  final semiRed = Color(0xffFF5D5D);
  final red = Color(0xffFF003A);
  final defaultBackground = Color(0xffF9F9F9);
  final newsCardBackground = Color(0xffFEFEFE);
}

class UIIcons {
  //class with links to icons assets
  final String navEditIcon = "assets/images/navbarIcons/edit.svg";
  final String navEventsIcon = "assets/images/navbarIcons/events.svg";
  final String navSchedulte = "assets/images/navbarIcons/schedule.svg";
  final String newsLikeButton = "assets/images/newsIcons/like.svg";
  final String newsLikeActiveButton = "assets/images/newsIcons/likeActive.svg";
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
          color: colors.black

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
    this.textColor = colors.black;
    this.fontWeight = FontWeight.w600;
  }

  TabBarTabItem.disabled(String text){
    this.text = text;
    this.textColor = colors.disabled;
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
            backgroundColor: UIcolors.defaultBackground,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: AppBarTextHeader(header),
              bottom: TabBar(
                controller: _controller,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: 5.0, color: ui.UIcolors.primary),
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