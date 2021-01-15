import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart' as config;

bool IsSuccessStatusCode(int statusCode) {
  return (statusCode >= 200) && (statusCode <= 299);
}

Future<Map> makeGetRequest({String endpoint, Map data, String token}) async {
  String dataString = "?";

  for (var key in data.keys) {
    dataString += key.toString() + "=" + data[key].toString() + "&";
  }

  final response = await http.get(config.base_url + endpoint + dataString,
      headers: {"Authorization": "Token " + token});

  var rj = json.decode(utf8.decode(response.bodyBytes));
  //print(config.base_url+endpoint+dataString);
  if (!IsSuccessStatusCode(response.statusCode)) {
    return {"ok": false, "response": rj};
  } else {
    return {"ok": true, "response": rj};
  }
}

Future<Map> makePostRequest({String endpoint, Map data, String token}) async {
  print(config.base_url + endpoint);
  final response = await http.post(config.base_url + endpoint,
      headers: {"Authorization": "Token " + token}, body: data);

  var rj = json.decode(utf8.decode(response.bodyBytes));

  if (!IsSuccessStatusCode(response.statusCode)) {
    return {"ok": false, "response": rj};
  } else {
    return {"ok": true, "response": rj};
  }
}

Future<Map> makePostRequestNoToken({String endpoint, Map data}) async {
  final response = await http.post(config.base_url + endpoint, body: data);

  var rj = json.decode(utf8.decode(response.bodyBytes));

  if (!IsSuccessStatusCode(response.statusCode)) {
    return {"ok": false, "response": rj};
  } else {
    return {"ok": true, "response": rj};
  }
}
