import '../network_helpers/make_request.dart';

class Comments {
  String token;

  Comments(this.token);

  Future<Map> get({int postid}) async {
    final response = await makeGetRequest(
        endpoint: "news/post-comments/get/",
        token: token,
        data: {"post": postid.toString()});
    return response;
  }

  Future<Map> create({int postid, String text, String header}) async {
    final response = await makePostRequest(
        endpoint: "news/post-comments/create/",
        token: token,
        data: {"post": postid.toString(), "header": header, "text": text});
    return response;
  }

  Future<Map> update({int id, String text = "", String header = ""}) async {
    Map data = {};
    if (text != "") {
      data['text'] = text;
    }
    if (header != "") {
      data['header'] = header;
    }
    final response = await makePostRequest(
        endpoint: "news/post-comments/update/?comment=" + id.toString(),
        token: token,
        data: data);
    return response;
  }

  Future<Map> delete({int id}) async {
    final response = await makeGetRequest(
        endpoint: "news/post-comments/delete/",
        token: token,
        data: {"id": id.toString()});
    return response;
  }
}
