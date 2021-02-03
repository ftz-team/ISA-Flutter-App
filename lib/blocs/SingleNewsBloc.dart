import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/models/newsModels/NewsExtendedModel.dart';

class SingleNewsBloc {
  NewsExtendedModel _news;
  bool _commentsOpened;

  SingleNewsBloc() {}

  final _newsFetcher = PublishSubject<NewsExtendedModel>();

  Stream<NewsExtendedModel> get news => _newsFetcher.stream;

  getNews(int id) {
    String mainPicUrl;

    //TODO check data in localStorage, if data exist in storage return data, else call api, then return data and finaly save in storage

    mainPicUrl =
        'https://i.pinimg.com/originals/b7/c5/4a/b7c54ade469a1a058c828cac2b5c650e.jpg';
    _news = NewsExtendedModel.fromJson({
      'header':
          'Итоги недели иностранного языка «Новый год шагает по планете» (21.12.20-25.12.20)',
      'asset': Image.network(
        mainPicUrl,
        fit: BoxFit.fitWidth,
      ),
      'likes': 29,
      'who_liked': [1, 2, 3],
      'time': '26 декабря 2020',
      'type': 'news',
      'id': 1,
      'liked': true,
      'text':
          'В период с 21 по 25 января 2020г прошла Неделя Иностранного языка «Рождество шагает по планете.Все запланированные мероприятия прошли успешно, красочно, создавая предпраздничное настроение ученикам, родителям и учителям.По итогам Недели ИЯ 51 учащийся стали победителями и призерами различных конкурсов и проектов. Они получат грамоты а учителя, принявшие активное участие, благодарственные письма. В 1 корпусе (2-4 классы) прошли открытые уроки и беседы, посвященные Рождеству, конкурс стихов, открыток и Новогодней игрушки.',
      'pinned': false,
      'comments': 2,
      'author': "Ушакова М.Г.",
      'authorStatus': "учитель англ. языка",
      'authorUrl':
      "https://pickaface.net/gallery/avatar/unr_test_180821_0925_9k0pgs.png",
    });
    //print("YADAUN");
    _newsFetcher.sink.add(_news);
  }

  void toogleComments() {
    _commentsOpened = !_commentsOpened;
  }

  int likeNews(int id) {
    //TODO call api with id
    print(_news.likes);
    _news.liked = !_news.liked;
    if (_news.liked) {
      _news.likes = _news.likes + 1;
    } else {
      _news.likes = _news.likes - 1;
    }

    print(_news.likes);
    _newsFetcher.sink.add(_news);
    return _news.likes;
  }

  dispose() {
    _newsFetcher.close();
  }
}

final singleNewsBloc = SingleNewsBloc();
