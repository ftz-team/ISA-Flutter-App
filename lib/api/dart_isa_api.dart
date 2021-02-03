import 'dart:async';

import 'package:flutter/services.dart';

import 'Events/Events.dart';
import 'News/News.dart';
import 'Threads/Threads.dart';
import 'Users/Users.dart';

class DartIsaApi {
  static const MethodChannel _channel = const MethodChannel('dart_isa_api');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  isa_api getApi(String token) {
    return new isa_api(token);
  }
}

class isa_api {
  String token;
  Messages messages;
  Events events;
  Users users;
  Threads threads;
  News news;

  isa_api(this.token) {
    messages = new Messages(token);
    events = new Events(token);
    users = new Users(token);
    threads = new Threads(token);
    news = News(token);
  }
}

class Messages {
  String token;

  Messages(this.token);
}
