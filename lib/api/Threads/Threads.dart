import '../network_helpers/make_request.dart';

class Threads {
  String token;

  Threads(this.token);

  Future<Map> get({int last, int step, int parent}) async {
    final response = await makeGetRequest(
        endpoint: "news/get-threads/",
        token: token,
        data: {"last": last, "step": step, "parent": parent});
    return response;
  }

  Future<Map> like({int threadId}) async {
    var response = await makePostRequest(
        endpoint: "news/like-thread/",
        token: token,
        data: {"post": threadId.toString(), "type": "like"});
    return response;
  }

  Future<Map> unlike({int threadId}) async {
    var response = await makePostRequest(
        endpoint: "news/like-thread/",
        token: token,
        data: {"post": threadId.toString(), "type": "unlike"});
    return response;
  }

  Future<Map> dislike({int threadId}) async {
    var response = await makePostRequest(
        endpoint: "news/like-thread/",
        token: token,
        data: {"post": threadId.toString(), "type": "dislike"});
    return response;
  }

  Future<Map> undislike({int threadId}) async {
    var response = await makePostRequest(
        endpoint: "news/like-thread/",
        token: token,
        data: {"post": threadId.toString(), "type": "undislike"});
    return response;
  }

  Future<Map> create(
      {String header, String text, int parent = 0, int author}) async {
    var response = await makePostRequest(
        endpoint: "news/create-thread/",
        token: token,
        data: {
          "header": header.toString(),
          "text": text,
          "author": author.toString(),
          "parent": parent.toString()
        });
    return response;
  }

  Future<Map> update({int thread, String header = "", String text = ""}) async {
    var response = await makePostRequest(
      endpoint: "news/update-thread/",
      token: token,
      data: {"header": header, "id": thread.toString(), "text": text},
    );
    return response;
  }
}
