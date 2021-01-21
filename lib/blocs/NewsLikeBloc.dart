import 'package:rxdart/rxdart.dart';

class NewsLikeBloc {
  int _likes_cnt;
  bool _liked;

  NewsLikeBloc() {}

  final _likesFetcher = PublishSubject<List>();

  Stream<List> get likesData => _likesFetcher.stream;

  like(int newsId, bool liked) {
    //TODO call api
    _liked = !_liked;
    _likesFetcher.sink.add([_likes_cnt + 1, _liked]);
  }

  getLikes(int likes_cnt, bool liked) {
    _likes_cnt = likes_cnt;
    _liked = liked;
    //TODO call api
    _likesFetcher.sink.add([_likes_cnt, _liked]);
  }

  dispose() {
    _likesFetcher.close();
  }
}

final newsLikeBloc = NewsLikeBloc();
