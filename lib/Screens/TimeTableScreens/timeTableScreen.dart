import 'package:flutter/material.dart';
import 'package:isa_new/Screens/TimeTableScreens/EventsScreen.dart';
import 'package:isa_new/Screens/TimeTableScreens/ScheduleScreen.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/blocs/ScheduleBloc.dart';

class timeTableScreen extends UIItem {
  @override
  Widget build(BuildContext context) {
    scheduleBloc.getCurrentHeader();
    return
      StreamBuilder(
          stream: scheduleBloc.header,
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return PageWithTabs(["Расписание", "События"],
                [ScheduleScreen(), EventsScreen()], snapshot.data,
                underlineColor: UIColors.yellow,);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            scheduleBloc.getCurrentHeader();
            return Center(child: CircularProgressIndicator());
          });
  }
}
