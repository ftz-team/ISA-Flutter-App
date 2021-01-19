import 'package:flutter/material.dart';
import 'package:isa_new/UI/NewsWidgets/news.dart';
import 'package:isa_new/blocs/NewsBloc.dart';
import 'package:isa_new/models/NewsModel.dart';

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
            return buildNewsList(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

Widget buildNewsList(List modelsList) {
  return ListView(
    children: [
      for (var i in modelsList) NewsCardInner(i, () {
        newsBloc.likeNews(i.id);
      })
    ],
  );
}