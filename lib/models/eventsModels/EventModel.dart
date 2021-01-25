import 'package:isa_new/models/AbstractModel.dart';

class EventModel extends AbstractIsaModel {
  String _name;
  String _place;
  DateTime _dStart;
  String _type;
  DateTime _dEnd;

  EventModel.fromJson(Map parsedJson) {
    this._name = parsedJson['name'];
    this._place = parsedJson['place'];
    this._dStart = parsedJson['dStart'];
    this._dEnd = parsedJson['dEnd'];
    this._type = parsedJson['type'];
  }
}
