import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/EventsWidgets/events.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/blocs/ScheduleBloc.dart';
import 'package:isa_new/models/eventsModels/EventModel.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreenState createState() => ScheduleScreenState();
}

class ScheduleScreenState extends State<ScheduleScreen> {
  var selected = DateTime.now();
  List<EventModel> _events = [];

  Future<List<EventModel>> fetchEvents() async {
    var news = await scheduleBloc.getEventsToSelected(DateTime.now());
    setState(() {
      _events = news;
    });
  }

  @override
  void initState() {
    fetchEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: displayHeight(context) * 0.02,
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(
                  left: displayWidth(context) * 0.07,
                  right: displayWidth(context) * 0.07,
                ),
                child: StreamBuilder(
                    stream: scheduleBloc.dates,
                    builder: (context, AsyncSnapshot<List<DateTime>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          controller: scheduleBloc.WeekDatesController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var i in snapshot.data)
                              GestureDetector(
                                onTap: () async {
                                  var _nevents = await scheduleBloc
                                      .getEventsToSelected(i);
                                  setState(() {
                                    selected = i;
                                    _events = _nevents;
                                  });
                                },
                                child: (i.day == selected.day &&
                                    i.month == selected.month)
                                    ? dayCard.selected(i)
                                    : dayCard(i),
                              )

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
              child: Container(
                padding: EdgeInsets.only(
                  left: displayWidth(context) * 0.05,
                  right: displayWidth(context) * 0.05,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0.4,
                      blurRadius: 1,
                      offset: Offset(0, -3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView(

                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.02,
                        bottom: displayHeight(context) * 0.02,
                      ),
                      child: Row(
                        children: [
                          EventCategoryCard("Школа", UIColors.yellow),
                          EventCategoryCard("Лекции", UIColors.primary),
                        ],
                      ),
                    ),
                    for (var i in _events) Container(
                      margin: EdgeInsets.only(
                          top: displayHeight(context) * 0.02
                      ),
                      child: EventListItem(i),
                    ),
                    Container(
                      width: 200,
                      height: displayHeight(context) * 0.05,
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
