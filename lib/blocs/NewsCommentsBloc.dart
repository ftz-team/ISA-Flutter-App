import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/models/newsModels/NewsCommentModel.dart';
import 'package:rxdart/rxdart.dart';

class NewsCommentsBloc {
  List<NewsCommentModel> _comments;

  final _commentsFetcher = PublishSubject<List<NewsCommentModel>>();

  Stream<List<NewsCommentModel>> get comments => _commentsFetcher.stream;

  fetchComments(int postId) async {
    //TODO call api with globals.API
    _comments = [
      NewsCommentModel.fromJson({
        'author': 1,
        'author_name': 'Артём Сидоренко',
        'text': 'Не ожидал, что стану победителем, но это очень приятно',
        'image': CachedNetworkImage(
          imageUrl:
              "https://consequenceofsound.net/wp-content/uploads/2020/09/lil-peep-hellboy-available-streaming-services.jpg?quality=80",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      }),
      NewsCommentModel.fromJson({
        'author': 1,
        'author_name': 'Артём Сидоренко',
        'text': 'Не ожидал, что стану победителем, но это очень приятно',
        'image': CachedNetworkImage(
          imageUrl:
              "https://consequenceofsound.net/wp-content/uploads/2020/09/lil-peep-hellboy-available-streaming-services.jpg?quality=80",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      }),
      NewsCommentModel.fromJson({
        'author': 1,
        'author_name': 'Артём Сидоренко',
        'text': 'Не ожидал, что стану победителем, но это очень приятно',
        'image': CachedNetworkImage(
          imageUrl:
              "https://consequenceofsound.net/wp-content/uploads/2020/09/lil-peep-hellboy-available-streaming-services.jpg?quality=80",
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      })
    ];
    print("!!!!!!!!!");
    _commentsFetcher.add(_comments);
  }

  dispose() {
    _commentsFetcher.close();
  }

  void publish(String text, int newsId) {}
}

NewsCommentsBloc snewsCommentsBloc = new NewsCommentsBloc();
