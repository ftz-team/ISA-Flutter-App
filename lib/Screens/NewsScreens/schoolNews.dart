import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/NewsWidgets/news.dart';
import 'package:isa_new/blocs/NewsBloc.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/models/newsModels/NewsModel.dart';

class schoolNews extends StatefulWidget {
  schoolNewsState createState() => schoolNewsState();
}

class schoolNewsState extends State<schoolNews> {
  List<Map> news = [];
  bool loaded = false;

  void getNews() {
    //TODO call api
    this.news.add({});
  }

  @override
  Widget build(BuildContext context) {
    newsBloc.fetchNews();
    return StreamBuilder(
        stream: newsBloc.news,
        builder: (context, AsyncSnapshot<List<NewsModel>> snapshot) {
          if (snapshot.hasData) {
            return buildNewsList(snapshot.data, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

Widget buildNewsList(List modelsList, BuildContext context) {
  return ListView(
    children: [
      for (var i in modelsList)
        NewsCardInner(i, () {
          newsBloc.likeNews(i.id);
        }),
      Container(
        height: displayHeight(context) * 0.03,
        width: displayWidth(context),
      )
    ],
  );
}