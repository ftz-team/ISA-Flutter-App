import 'package:flutter/material.dart';
import 'package:isa_new/models/AbstractModel.dart';

class NewsCommentModel extends AbstractIsaModel {
  int _uid;
  String _userName;
  String _text;
  Widget _userImage;

  NewsCommentModel.fromJson(parsedJson) {
    this._uid = parsedJson['author'];
    this._userName = parsedJson['author_name'];
    this._text = parsedJson['text'];
    this._userImage = parsedJson['image'];
  }

  int get uid => this._uid;

  String get user => this._userName;

  String get text => this._text;

  Widget get image => this._userImage;

  Widget getWidget() {
    return Container();
  }
}
