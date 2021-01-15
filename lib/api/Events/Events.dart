import '../dateHelpers.dart';
import '../network_helpers/make_request.dart';
import 'Feedback.dart';

class Events {
  String token;
  Feedback feedback;

  Events(this.token) {
    feedback = Feedback(token);
  }

  getChosenEvents() {}

  Future<Map> choose({int eventId}) async {
    var response = await makePostRequest(
        token: token,
        endpoint: 'events/choose-event/?event=' + eventId.toString(),
        data: {});
    var sucsess = response['ok'];
    if (sucsess) {
      return response;
    } else {
      return response;
    }
  }

  Future<Map> unchoose({int eventId}) async {
    var response = await makePostRequest(
        token: token,
        endpoint: 'events/unchoose-event/?event=' + eventId.toString(),
        data: {});
    var sucsess = response['ok'];
    if (sucsess) {
      return response;
    } else {
      return response;
    }
  }

  Future<Map> get(
      {DateTime timeStart, DateTime timeEnd, int last, int step}) async {
    List events = [];
    final response = await makeGetRequest(data: {
      "step": step,
      "last": last,
      "date_from": djangoS(timeStart),
      "date_to": djangoS(timeEnd),
    }, token: token, endpoint: "events/get-all-events");

    if (!response['ok']) {
      return {"ok": false, "response": response};
    } else {
      events.addAll(response['response']);
      return {"ok": true, "response": events};
    }
  }

  Future<Map> getTest(
      {DateTime timeStart, DateTime timeEnd, int last, int step}) async {
    return {
      "ok": true,
      "response": {
        "id": 1,
        "header": "Test Post",
        "text": 'print("Hello World!")',
        'likes': 4,
        'image': 'http://151.248.118.41/media/default.png',
        'who_liked': [4, 5, 6, 2],
        'date': '2020-12-14T23:15:02Z'
      }
    };
  }

  Future<Map> delete({int eventId}) async {
    final response = await makePostRequest(
        endpoint: "events/delete-event?id=" + eventId.toString(),
        token: token,
        data: {});

    if (response['ok']) {
      return {"ok": true};
    } else {
      return {"ok": false};
    }
  }

  Future<Map> getOne({int eventId}) async {
    final response = await makeGetRequest(
        endpoint: "events/get-event/", token: token, data: {"id": eventId});
    if (response['ok']) {
      return response;
    } else {
      return response;
    }
  }

  Future<Map> create({int eventId}) async {
    final response = await makeGetRequest(
        endpoint: "events/get-event/", token: token, data: {"id": eventId});
    if (response['ok']) {
      return response;
    } else {
      return response;
    }
  }
}
