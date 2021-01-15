import 'package:isa_new/models/NewsModel.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  List<NewsModel> _news;

  NewsBloc() {}

  final _newsFetcher = PublishSubject<List<NewsModel>>();

  Stream<List<NewsModel>> get news => _newsFetcher.stream;

  likeNews(int id) {
    //TODO call api with id
    for (int i = 0; i < _news.length; i++) {
      _news[i].liked = false;
      print(_news[i].liked);
    }
    _newsFetcher.sink.add([
      NewsModel.fromJson(
        {
          "header": "Заголовок",
          "asset":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOuYqrXUba_fWeymUBiMWE0zel0s9LlNSCwQ&usqp=CAU",
          "likes": 25,
          "who_liked": [1, 2, 5, 21],
          "time": "21.03.2019",
          "type": "news",
          "id": 1,
          "liked": true
        },
      ),
    ]);
  }

  fetchNews() async {
    //TODO call api with globals.API

    _news = await [
      NewsModel.fromJson(
        {
          "header": "Заголовок",
          "asset":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOuYqrXUba_fWeymUBiMWE0zel0s9LlNSCwQ&usqp=CAU",
          "likes": 25,
          "who_liked": [1, 2, 5, 21],
          "time": "21.03.2019",
          "type": "news",
          "id": 1,
          "liked": false
        },
      ),
      NewsModel.fromJson(
        {
          "header": "Опрос сосос",
          "asset":
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOuYqrXUba_fWeymUBiMWE0zel0s9LlNSCwQ&usqp=CAU",
          "likes": 25,
          "who_liked": [1, 2, 5, 21],
          "time": "21.03.2019",
          "type": "poll",
          "id": 1,
          "liked": true
        },
      ),
    ];
    _newsFetcher.sink.add(_news);
  }

  dispose() {
    _newsFetcher.close();
  }
}

final newsBloc = NewsBloc();
