import '../models/AbstractModel.dart';

class NewsModel extends AbstractIsaModel {
  int _id;
  String _header;
  String _asset;
  int _likes;
  List<int> _who_liked;
  String _time;
  String _type;
  bool _liked;

  NewsModel.fromJson(parsedJson) {
    _header = parsedJson['header'];
    _asset = parsedJson['asset'];
    _likes = parsedJson['likes'];
    _who_liked = parsedJson['who_liked'];
    _time = parsedJson['time'];
    _type = parsedJson['type'];
    _id = parsedJson['id'];
    _liked = parsedJson['liked'];
    print("!!!");
    print(_liked);
  }

  int get id => _id;

  String get header => _header;

  String get asset => _asset;

  int get likes => _likes;

  List get who_liked => _who_liked;

  String get time => _time;

  String get type => _type;

  bool get liked => _liked;

  set liked(bool liked) => _liked = liked;
}
