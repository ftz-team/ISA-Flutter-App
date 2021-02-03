import 'package:flutter/material.dart';
import 'package:isa_new/Screens/NewsScreens/schoolNews.dart';
import 'package:isa_new/UI/UI.dart';

class newsScreen extends UIItem {
  @override
  Widget build(BuildContext context) {
    return PageWithTabs([
      "Новости",
      "Общее"
    ], [
      schoolNews(),
      Container(
        child: Text('общее'),
      )
    ], "Новости");
  }
}
