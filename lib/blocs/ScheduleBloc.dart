import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isa_new/api/dateHelpers.dart';
import 'package:isa_new/globals.dart' as globals;
import 'package:isa_new/models/eventsModels/EventModel.dart';
import 'package:rxdart/rxdart.dart';

class ScheduleBloc {
  ScrollController WeekDatesController;
  List<EventModel> _eventsList;
  List<DateTime> _dates = [];
  DateTime _lastAddedDate = DateTime.now();

  ScheduleBloc() {
    this.WeekDatesController = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (WeekDatesController.position.extentAfter < 70) {
      getCurrentWeekDates();
      getCurrentHeader();
    }
  }

  final _datesFetcher = PublishSubject<List<DateTime>>();

  Stream<List<DateTime>> get dates => _datesFetcher.stream;

  final _dateForHeader = PublishSubject<String>();

  Stream<String> get header => _dateForHeader.stream;

  void getCurrentHeader() {
    String header =
        month(_lastAddedDate.month) + " " + _lastAddedDate.year.toString();
    print(header);
    _dateForHeader.sink.add(header);
  }

  Future<List<EventModel>> getEventsToSelected(DateTime day) async {
    print(day);
    //TODO call api
    var res = await globals.API.events.get(
      last: 0,
      step: 10000,
      timeStart: day.add(Duration(hours: -day.hour, minutes: -day.minute + 1)),
      timeEnd: day
          .add(Duration(hours: -day.hour, minutes: -day.minute + 1, days: 1)),
    );
    print(res);
    List events = res['response'];

    List<EventModel> itog = [];

    for (int i = 0; i < events.length - 1; i++) {
      EventModel current = events[i];
      EventModel next = events[i + 1];
      itog.add(current);
      int diff;

      diff = max(next.dStart.hour - current.dEnd.hour, 0) * 60;
      if (diff >= 0) {
        diff = diff + max(next.dStart.minute - current.dEnd.minute, 0);
      }
      print(current.dEnd);
      print(next.dStart);
      print(diff);
      if (diff >= 15) {
        itog.add(EventModel.empty({
          'dStart': current.dEnd,
          'dEnd': next.dStart,
        }));
      }
    }

    itog.add(events[events.length - 1]);

    return itog;
  }

  void getCurrentWeekDates() {
    DateTime now = _lastAddedDate;
    DateTime firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    for (int i = 0; i < 7; i++) {
      DateTime newDate = firstDayOfWeek.add(Duration(days: i));
      _dates.add(newDate);
      _lastAddedDate = newDate;
    }
    _lastAddedDate = _lastAddedDate.add(Duration(days: 1));

    _datesFetcher.sink.add(_dates);
  }

  dispose() {
    WeekDatesController.removeListener(_scrollListener);
    _datesFetcher.close();
    _dateForHeader.close();
  }
}

final scheduleBloc = ScheduleBloc();
