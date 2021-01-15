class ChatContactsModel {
  int _uid;
  String _nickName;
  bool _active;
  String _lastOnline;
  String _asset;

  ChatContactsModel.fromJson(Map parsedJson) {
    _uid = parsedJson['uid'];
    _nickName = parsedJson['username'];
    _active = parsedJson['active'];
    _lastOnline = parsedJson['last_online'];
    _asset = parsedJson['asset'];
    //TODO load asset from the user model
  }

  int get uid => _uid;

  String get nickName => _nickName;

  bool get active => _active;

  String get lastOnline => _lastOnline;

  String get asset => _asset;
}
