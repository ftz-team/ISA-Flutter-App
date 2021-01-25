import 'package:isa_new/models/AbstractModel.dart';

class MessageModel extends AbstractIsaModel {
  String _text;
  int _uid;
  String _authorName;
  DateTime _date;
  bool _readed;

  MessageModel.fromJson(Map parsedJson) {
    _text = parsedJson['text'];
    _uid = parsedJson['uid'];
    _authorName = parsedJson['authorName'];
    _readed = parsedJson['readed'];
    _date = parsedJson['date'];
  }
}
