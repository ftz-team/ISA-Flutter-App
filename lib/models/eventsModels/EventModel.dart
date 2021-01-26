import 'package:isa_new/api/dateHelpers.dart';
import 'package:isa_new/models/AbstractModel.dart';

class EventModel extends AbstractIsaModel {
  int id;
  String _name;
  String _place;
  DateTime _dStart;
  String _type;
  DateTime _dEnd;
  bool chosen = false;

  EventModel.fromJson(Map parsedJson) {
    print(parsedJson['date_start']);
    var sss = parsedJson['date_start'];
    print(sss);
    print(123123213123213123);
    var start = getDateTimeFromDjango(sss);
    var end = getDateTimeFromDjango(parsedJson['date_finish']);
    this._name = parsedJson['name'];
    this._place = parsedJson['location'].toString();
    this._dStart = start;
    this._dEnd = end;
    this._type = parsedJson['type'];
    this.chosen = parsedJson['is_chosen'];
    this.id = parsedJson['id'];
  }

  EventModel.empty(Map parsedJson) {
    this._dStart = parsedJson['dStart'];
    this._dEnd = parsedJson['dEnd'];
  }

  String get name => _name;

  String get place => _place;

  String get type => _type;

  DateTime get dStart => _dStart;

  DateTime get dEnd => _dEnd;
}
