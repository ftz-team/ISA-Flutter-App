import 'package:flutter/material.dart';

import '../AbstractModel.dart';

class NewsExtendedModel extends AbstractIsaModel {
  int _id;
  String _header;
  Image _asset;
  int _likes;
  String _text;
  String _author;
  List<int> _who_liked;
  String _time;
  String _type;
  bool _liked;
  bool _pinned;
  int _poll;
  String _authorStatus;
  String _authorUrl;
  int _comments;

  NewsExtendedModel.fromJson(parsedJson) {
    _header = parsedJson['header'];

    _asset = parsedJson['asset'];
    _likes = parsedJson['likes'];
    _who_liked = parsedJson['who_liked'];
    _time = parsedJson['time'];
    _type = parsedJson['type'];
    _id = parsedJson['id'];
    _liked = parsedJson['liked'];
    _text = parsedJson['text'];
    _pinned = parsedJson['pinned'];
    _comments = parsedJson['comments'];
    _author = parsedJson['author'];
    _authorStatus = parsedJson['authorStatus'];
    _authorUrl = parsedJson['authorUrl'];
  }

  int get id => _id;

  String get header => _header;

  String get author => _author;

  String get authorStatus => _authorStatus;

  String get authorUrl => _authorUrl;

  Image get asset => _asset;

  int get likes => _likes;

  set likes(int likes) => _likes = likes;

  List get who_liked => _who_liked;

  String get time => _time;

  String get type => _type;

  bool get liked => _liked;

  set liked(bool liked) => _liked = liked;

  String get text => _text;

  bool get pinned => _pinned;

  int get comments => _comments;

  int get poll => _poll;
}
