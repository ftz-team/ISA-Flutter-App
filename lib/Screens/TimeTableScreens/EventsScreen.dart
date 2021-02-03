import 'package:flutter/material.dart';
import 'package:isa_new/UI/UI.dart';

class EventsScreen extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          /*EventToChoose(
              EventModel.fromJson(
                  {
                    'name': "Русский язык",
                    'place': "306 каб.",
                    'dStart': DateTime(2021,1,1,8,30),
                    'dEnd': DateTime(2021,1,1,10,30),
                    'type': "lesson",
                    'chosen' : true
                  }
              )
          ),*/
        ],
      ),
    );
  }
}
