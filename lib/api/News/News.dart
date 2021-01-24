import 'package:isa_new/api/dateHelpers.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/models/newsModels/NewsModel.dart';

import '../network_helpers/make_request.dart';
import 'Comments.dart';

class News {
  String token;
  Comments comments;

  News(this.token) {
    comments = Comments(token);
  }

  Future<List<NewsModel>> get({int last, int step}) async {
    final response = await makeGetRequest(
        endpoint: "news/get-posts/",
        token: token,
        data: {"last": last, "step": step});
    if (response['ok']) {
      List<NewsModel> newsList = [];
      for (int i = 1; i < response['response'].length; i++) {
        String newDate = "";
        bool flag = false;
        for (int j = 0; j < response['response'][i]['date'].length; j++) {
          if (response['response'][i]['date'][j] == ".") {
            newDate = newDate + "Z";
            flag = true;
            break;
          } else {
            if (!flag) {
              newDate = newDate + response['response'][i]['date'][j];
            }
          }
        }
        if (response['response'][i].containsKey('is_liked')) {
          response['response'][i]['liked'] =
              response['response'][i]['is_liked'];
        } else {
          response['response'][i]['liked'] = false;
        }

        //TODO replace with data from api
        response['response'][i]['image'] =
            "https://cms.hostelworld.com/hwblog/wp-content/uploads/sites/2/2018/12/kirkjufell.jpg";
        response['response'][i]['time'] = dmy(DateTime.parse(newDate));

        newsList.add(NewsModel.fromJson(response['response'][i]));
      }
      return newsList;
    }
    return null;
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
