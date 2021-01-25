import 'file:///D:/AndroidStudioProjects/isa_new/lib/models/chatModels/DialogModel.dart';

class ChatModel {
  //chat screen with dialogs
  String _userName;
  String _lastMsg;
  String _lastMsgTime;
  bool _readed;
  String _userImg;
  String _lastOnline;

  List<DialogModel> _dialogs = [];

  ChatModel.fromJson(parsedJson) {
    _userName = parsedJson['username'];
    _lastMsg = parsedJson['lastMsg'];
    _lastMsgTime = parsedJson['lastMsgTime'];
    _readed = parsedJson['readed'];
    _lastOnline = parsedJson['last_online'];
    _userImg = parsedJson['userImg'];
  }

  String get userImg => _userImg;

  String get lastMsg => _lastMsg;

  String get lastMsgTime => _lastMsgTime;

  bool get readed => _readed;

  String get lastOnline => _lastOnline;

  String get userName => _userName;
}
