import '../models/AbstractModel.dart';

class NewsModel extends AbstractIsaModel {
  int _id;
  String _header;
  String _asset;
  int _likes;
  String _time;
  String _type;
  bool _liked;

  NewsModel.fromJson(parsedJson) {
    _header = parsedJson['header'];
    _asset = parsedJson['image'];
    _likes = parsedJson['likes'];
    _time = parsedJson['time'];
    _type = parsedJson['type'];
    _id = parsedJson['id'];
    _liked = parsedJson['liked'];
  }

  int get id => _id;

  String get header => _header;

  String get asset => _asset;

  int get likes => _likes;

  String get time => _time;

  String get type => _type;

  bool get liked => _liked;

  set liked(bool liked) => _liked = liked;

  set likes(int likes) => _likes = likes;
}
