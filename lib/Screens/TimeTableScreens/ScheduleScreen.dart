import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/EventsWidgets/events.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/blocs/ScheduleBloc.dart';

class ScheduleScreen extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: displayHeight(context) * 0.02,
        left: displayWidth(context) * 0.05,
        right: displayWidth(context) * 0.05,
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  left: displayWidth(context) * 0.02,
                  right: displayWidth(context) * 0.02,
                ),
                child: StreamBuilder(
                    stream: scheduleBloc.dates,
                    builder: (context, AsyncSnapshot<List<DateTime>> snapshot) {
                      if (snapshot.hasData) {
                        var now = DateTime.now();
                        return ListView(
                          controller: scheduleBloc.WeekDatesController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var i in snapshot.data)
                              (i.day == now.day && i.month == now.month)
                                  ? dayCard.selected(i)
                                  : dayCard(i)
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      scheduleBloc.getCurrentWeekDates();
                      return Center(child: CircularProgressIndicator());
                    }),
              )),
          Expanded(
              flex: 8,
              child: ListView(
                children: [
                  Text(
                    "fwefwef",
                    style: UITypography.h3(context),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
