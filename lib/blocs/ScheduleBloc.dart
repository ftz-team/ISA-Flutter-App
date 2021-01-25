import 'package:flutter/material.dart';
import 'package:isa_new/api/dateHelpers.dart';
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
