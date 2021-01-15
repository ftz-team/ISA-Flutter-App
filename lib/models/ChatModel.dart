import 'package:isa_new/models/DialogModel.dart';

class ChatModel {
  //chat screen with dialogs
  String _userName;
  String _lastMsg;
  String _lastMsgTime;
  bool _readed;
  String _userImg;

  List<DialogModel> _dialogs = [];

  ChatModel.fromJson(parsedJson) {
    _userName = parsedJson['username'];
    _lastMsg = parsedJson['lastMsg'];
    _lastMsgTime = parsedJson['lastMsgTime'];
    _readed = parsedJson['readed'];
    _userImg = parsedJson['userImg'];
  }

  String get userImg => _userImg;

  String get lastMsg => _lastMsg;

  String get lastMsgTime => _lastMsgTime;

  bool get readed => _readed;

  String get userName => _userName;
}
