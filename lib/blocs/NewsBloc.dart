import 'package:isa_new/globals.dart' as globals;
import 'package:rxdart/rxdart.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/models/newsModels/NewsModel.dart';

class NewsBloc {
  List<NewsModel> _news;

  NewsBloc() {}

  final _newsFetcher = PublishSubject<List<NewsModel>>();

  Stream<List<NewsModel>> get news => _newsFetcher.stream;

  likeNews(int id) async {
    for (int i = 0; i < _news.length; i++) {
      if (id == _news[i].id) {
        _news[i].liked = !_news[i].liked;
        if (_news[i].liked) {
          _news[i].likes = _news[i].likes + 1;

          var response = await globals.API.news.likePost(postid: id);
          if (response['ok']) {
            _news[i].likes = response['response']['likes_count'];
          }
        } else {
          _news[i].likes = _news[i].likes - 1;
          var response = await globals.API.news.unlikePost(postid: id);
          if (response['ok']) {
            _news[i].likes = response['response']['likes_count'];
          }
        }
        break;
      }
    }
    _newsFetcher.sink.add(_news);
  }

  fetchNews() async {
    //TODO call api with globals.API
    //TODO add UIFILTER

    _news = await globals.API.news.get(last: 0, step: 4);
    _newsFetcher.sink.add(_news);
  }

  dispose() {
    _newsFetcher.close();
  }
}

final newsBloc = NewsBloc();
