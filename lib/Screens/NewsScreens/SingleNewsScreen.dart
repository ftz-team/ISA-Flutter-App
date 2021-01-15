import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/NewsWidgets/newsPageWidgets.dart';
import 'package:isa_new/models/NewsExtendedModel.dart';

class SingleNewsScreen extends StatefulWidget {
  int newsId;

  SingleNewsScreen(this.newsId);

  SingleNewsScreenState createState() => SingleNewsScreenState();
}

class SingleNewsScreenState extends State<SingleNewsScreen> {
  NewsExtendedModel data = NewsExtendedModel.fromJson({
    "header":
        'Итоги недели иностранного языка «Новый год шагает по планете» (21.12.20-25.12.20)',
    "asset":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOuYqrXUba_fWeymUBiMWE0zel0s9LlNSCwQ&usqp=CAU',
    "likes": 23,
    "who_liked": [1, 24, 3],
    "time": '26 декабря 2020',
    "type": 'news',
    "id": 12,
    "liked": true,
    "text":
        'В период с 21 по 25 января 2020г прошла Неделя Иностранного языка «Рождество шагает по планете».      Все запланированные мероприятия прошли успешно, красочно, создавая предпраздничное настроение ученикам, родителям и учителям.      По итогам Недели ИЯ 51 учащийся стали победителями и призерами различных конкурсов и проектов. Они получат грамоты,      а учителя, принявшие активное участие, благодарственные письма.      В 1 корпусе (2-4 классы) прошли открытые уроки и беседы, посвященные Рождеству, конкурс стихов, открыток и Новогодней игрушки.В период с 21 по 25 января 2020г прошла Неделя Иностранного языка «Рождество шагает по планете».      Все запланированные мероприятия прошли успешно, красочно, создавая предпраздничное настроение ученикам, родителям и учителям.      По итогам Недели ИЯ 51 учащийся стали победителями и призерами различных конкурсов и проектов. Они получат грамоты,      а учителя, принявшие активное участие, благодарственные письма.      В 1 корпусе (2-4 классы) прошли открытые уроки и беседы, посвященные Рождеству, конкурс стихов, открыток и Новогодней игрушки.',
    "pinned": false,
    "comments": 23,
  });

  //TODO get data from bloc

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: displayWidth(context) * 0.025,
                  right: displayWidth(context) * 0.025),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: displayHeight(context) * 0.02,
                        bottom: displayHeight(context) * 0.03),
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset("assets/images/backButton.svg"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [newsPageAuthorImage(data.asset)],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
