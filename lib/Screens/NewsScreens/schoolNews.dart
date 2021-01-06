import 'package:flutter/material.dart';
import 'package:isa_new/UI/news.dart';

class schoolNews extends StatefulWidget {
  List<NewsCard> news;

  schoolNewsState createState() => schoolNewsState();
}

class schoolNewsState extends State<schoolNews> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        NewsCard(),
      ],
    );
  }
}
