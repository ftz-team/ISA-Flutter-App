import '../network_helpers/make_request.dart';

class Users {
  String token;

  Users(this.token);

  Future<Map> register(
      {String userName,
      String password,
      String passwordConfirm,
      String email}) async {
    final response = await makePostRequestNoToken(
        endpoint: "rest-auth/registration/",
        data: {
          "username": userName,
          "password1": password,
          "password2": passwordConfirm,
          "email": email
        });
    return response;
  }

  Future<Map> login({String userName, String password}) async {
    final response =
        await makePostRequestNoToken(endpoint: "rest-auth/login/", data: {
      "username": userName,
      "password": password,
    });
    return response;
  }

  Future<Map> getById({int uid}) async {
    final response = await makeGetRequest(
        data: {"user": uid.toString()},
        token: token,
        endpoint: "profile/get-user/");
    var success = response['ok'];
    if (success) {
      return response;
    } else {
      return response;
    }
  }

  Future<Map> getCurrent() async {
    final response = await makeGetRequest(
        data: {}, token: token, endpoint: "profile/get-user/");
    var sucsess = response['ok'];
    if (sucsess) {
      return response;
    } else {
      return response;
    }
  }

  Future<Map> updateProfile({Map<String, dynamic> fields}) {
    final response = makePostRequest(
        endpoint: "profile/profile-update/", token: token, data: fields);
    return response;
  }
}
