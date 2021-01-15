import '../network_helpers/make_request.dart';
import 'Comments.dart';

class News {
  String token;
  Comments comments;

  News(this.token) {
    comments = Comments(token);
  }

  Future<Map> get({int last, int step}) async {
    final response = await makeGetRequest(
        endpoint: "news/get-posts/",
        token: token,
        data: {"last": last, "step": step});
    return response;
  }

  Future<Map> likePost({int postid}) async {
    final response =
        await makePostRequest(endpoint: "news/like-post/", token: token, data: {
      "post": postid.toString(),
      "type": "like",
    });
    return response;
  }

  Future<Map> unlikePost({int postid}) async {
    final response =
        await makePostRequest(endpoint: "news/like-post/", token: token, data: {
      "post": postid.toString(),
      "type": "unlike",
    });
    return response;
  }
}
