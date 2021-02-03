import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/NewsWidgets/newsComments.dart';
import 'package:isa_new/UI/NewsWidgets/newsPageWidgets.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/UI/UIHelpers.dart';
import 'package:isa_new/blocs/SingleNewsBloc.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/models/newsModels/NewsExtendedModel.dart';

class SingleNewsScreen extends StatefulWidget {
  int newsId;

  SingleNewsScreen(this.newsId);

  SingleNewsScreenState createState() => SingleNewsScreenState(newsId);
}

class SingleNewsScreenState extends State<SingleNewsScreen> {
  int newsId;
  bool _commentsOpened = false;

  void toogleComments() {
    setState(() {
      _commentsOpened = !_commentsOpened;
    });
  }

  SingleNewsScreenState(this.newsId);

  //TODO get data from bloc

  int flexxer = 0;
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    singleNewsBloc.getNews(newsId);
    return Scaffold(
        body: StreamBuilder(
            stream: singleNewsBloc.news,
            builder: (context, AsyncSnapshot<NewsExtendedModel> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                        child: Container(
                          height: displayHeight(context) * 0.065,
                          width: displayWidth(context),
                        ),
                        constraints: BoxConstraints(
                            maxHeight: 24, maxWidth: displayWidth(context))),
                    Container(
                      margin: EdgeInsets.only(
                        left: displayWidth(context) * 0.035,
                      ),
                      child: backButton(),
                    ),
                    ConstrainedBox(
                        child: Container(
                          height: displayHeight(context) * 0.025,
                          width: displayWidth(context),
                        ),
                        constraints: BoxConstraints(
                            maxHeight: 14, maxWidth: displayWidth(context))),
                    Expanded(
                      flex: 8,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: displayWidth(context) * 0.025,
                            right: displayWidth(context) * 0.025),
                        child: ListView(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    newsPageAuthorImage(
                                        snapshot.data.authorUrl),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Ушакова М.В.",
                                              style: UITypography.h3(context),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: displayHeight(context) *
                                                    0.005),
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "учитель англ. языка",
                                              style: UITypography.h4(context),
                                            ),
                                          )
                                        ],
                                      ),
                                      margin: EdgeInsets.only(
                                          left: displayWidth(context) * 0.02),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        snapshot.data.time,
                                        style: UITypography.h4(context,
                                            color: UIColors.disabled),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        singleNewsBloc
                                            .likeNews(snapshot.data.id);
                                      },
                                      child: Container(
                                          alignment: Alignment.topLeft,
                                          child: newsPageLikeButton(
                                              snapshot.data.likes,
                                              snapshot.data.liked,
                                              snapshot.data.id)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SingleNewsHeader(snapshot.data.header),
                            SingleNewsImage(snapshot.data.asset),
                            Container(
                              margin: EdgeInsets.only(
                                top: displayHeight(context) * 0.02,
                                bottom: displayHeight(context) * 0.02,
                              ),
                              child: SingleNewsText(snapshot.data.text),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _commentsOpened
                        ? newsComments(snapshot.data.id, toogleComments)
                        : bottomPanel(Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: toogleComments,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: displayHeight(context) * 0.012,
                                    ),
                                    width: displayWidth(context) * 0.45,
                                    height: displayHeight(context) * 0.0633,
                                    decoration: BoxDecoration(
                                      color: UIColors.semiBlue,
                                      borderRadius: BorderRadius.circular(
                                          displayWidth(context) * 0.06),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "35 комментариев",
                                      style: UITypography.h3(context,
                                          color: UIColors.primary),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                      ),
                    ))
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                singleNewsBloc.getNews(newsId);
                return Center(child: Text(snapshot.data.toString()));
              }
            }));
  }
}
