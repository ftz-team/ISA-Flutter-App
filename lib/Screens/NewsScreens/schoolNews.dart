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
    ListView(
      shrinkWrap: true,
      children: [
        NewsCard(NewsModel.fromJson({
          "header": 'Заголовок',
          "asset":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOuYqrXUba_fWeymUBiMWE0zel0s9LlNSCwQ&usqp=CAU',
          "likes": 23,
          "who_liked": [1, 2, 3, 4],
          "time": "21.02.2002",
          "type": 'news',
          "id": 23,
          "liked": true,
        })),
      ],
    );
  }
}

Widget buildNewsList(List modelsList) {
  return ListView(
    children: [
      for (var i in modelsList) NewsCard(i)
    ],
  );
}