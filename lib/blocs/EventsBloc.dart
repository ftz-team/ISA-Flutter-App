import 'package:isa_new/globals.dart' as globals;
import 'package:isa_new/models/eventsModels/EventModel.dart';
import 'package:rxdart/rxdart.dart';

class EventsBloc {
  int last = 0;
  int step = 10;
  List<EventModel> _events = [];

  EventsBloc() {
    _events = [];
  }

  final _eventsFetcher = PublishSubject<List<EventModel>>();

  Stream<List<EventModel>> get events => _eventsFetcher.stream;

  void clearList() {
    _events = [];
    _eventsFetcher.sink.add(_events);
    last = 0;
    step = 10;
  }

  Future<void> getAll(DateTime from, DateTime to) async {
    print(_events);
    var res = await globals.API.events.get(
      last: last,
      step: step,
      timeStart: from,
      timeEnd: to,
    );
    print(res);
    _events.addAll(res['response']);

    last = last + step;
    _eventsFetcher.sink.add(_events);
  }

  dispose() {
    _eventsFetcher.close();
  }
}

EventsBloc eventsBloc = EventsBloc();
