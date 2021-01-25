import 'package:flutter/material.dart';
import 'package:isa_new/Screens/TimeTableScreens/EventsScreen.dart';
import 'package:isa_new/Screens/TimeTableScreens/ScheduleScreen.dart';
import 'package:isa_new/UI/UI.dart';

class timeTableScreen extends UIItem {
  @override
  Widget build(BuildContext context) {
    return PageWithTabs(["Расписание", "События"],
        [ScheduleScreen(), EventsScreen()], "Январь 2021");
  }
}
