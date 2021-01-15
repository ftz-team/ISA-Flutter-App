import '../network_helpers/make_request.dart';

class Feedback {
  String token;

  Feedback(this.token);

  Future<Map> get({int eventId}) async {
    final response = await makeGetRequest(
        endpoint: "events/feedback-get/",
        token: token,
        data: {"event": eventId.toString()});
    return response;
  }

  Future<Map> create(
      {int eventId,
      String text,
      String header,
      int new_things,
      int intelligibility,
      int interestingness}) async {
    final response = await makePostRequest(
        endpoint: "events/feedback-create/",
        token: token,
        data: {
          "event": eventId.toString(),
          "header": header,
          "text": text,
          "interestingness": interestingness,
          "intelligibility": intelligibility,
          "new_things": new_things
        });
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
        endpoint: "events/feedback-update/?comment=" + id.toString(),
        token: token,
        data: data);
    return response;
  }

  Future<Map> delete({int id}) async {
    final response = await makeGetRequest(
        endpoint: "events/feedback-delete/",
        token: token,
        data: {"id": id.toString()});
    return response;
  }
}
