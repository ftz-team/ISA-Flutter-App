import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/blocs/NewsCommentsBloc.dart';
import 'package:isa_new/models/newsModels/NewsCommentModel.dart';

class OneComment extends UIItem {
  OneComment(this.comment);

  NewsCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: displayWidth(context) * 0.04,
        right: displayWidth(context) * 0.04,
      ),
      child: Row(
        children: [
          Container(
              width: displayHeight(context) * 0.082,
              height: displayHeight(context) * 0.082,
              child: ClipOval(
                child: comment.image,
              )),
          Container(
              width: displayWidth(context) * 0.76,
              margin: EdgeInsets.only(left: displayWidth(context) * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      comment.user,
                      style: UITypography.h4(context, weight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    comment.text,
                    style: UITypography.h3(context,
                        color: UIColors.black, weight: FontWeight.w400),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class inputField extends StatefulWidget {
  inputFieldState createState() => inputFieldState();
}

class inputFieldState extends State<inputField> {
  String currentUserAva =
      "https://static.billboard.com/files/2020/07/oliver-tree-2020-cr-Parker-Day-billboard-1548-1595254862-compressed.jpg";

  //TODO getch avatar from API

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: displayWidth(context) * 0.04,
        right: displayWidth(context) * 0.04,
      ),
      child: Row(
        children: [
          Container(
              child: ClipOval(
            child: CachedNetworkImage(
              width: displayHeight(context) * 0.082,
              height: displayHeight(context) * 0.082,
              imageUrl: currentUserAva,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fitHeight,
            ),
          )),
          Container(
            margin: EdgeInsets.only(left: displayWidth(context) * 0.02),
            child: Text(
              "Написать комментарий...",
              style: UITypography.h3(context,
                  color: UIColors.disabled, weight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}

class commentsDivider extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: displayHeight(context) * 0.013,
        left: displayWidth(context) * 0.04,
        right: displayWidth(context) * 0.04,
      ),
      height: displayHeight(context) * 0.001,
      width: displayWidth(context),
      decoration: BoxDecoration(color: UIColors.disabled),
    );
  }
}

class newsComments extends UIItem {
  Function toogle;
  int flexxer = 9;
  int _newsid;

  newsComments(this._newsid, this.toogle);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flexxer,
        child: StreamBuilder(
            stream: snewsCommentsBloc.comments,
            builder: (context, AsyncSnapshot<List<NewsCommentModel>> snapshot) {
              snewsCommentsBloc.fetchComments(1);
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.03,
                          bottom: displayHeight(context) * 0.03),
                      decoration: BoxDecoration(
                        color: UIColors.defaultBackground,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 4,
                            blurRadius: 4,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: displayWidth(context) * 0.03),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Комментарии",
                                    style: UITypography.h3(context,
                                        weight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: displayWidth(context) * 0.015),
                                  child: Text(
                                    "35",
                                    style: UITypography.h3(context),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: toogle,
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: displayWidth(context) * 0.04),
                              child: SvgPicture.asset(
                                ui.icons.cancelButton,
                                width: displayWidth(context) * 0.045,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: displayHeight(context) * 0.02),
                      child: inputField(),
                    ),
                    commentsDivider(),
                    for (var i in snapshot.data)
                      Container(
                        margin: EdgeInsets.only(
                            top: displayHeight(context) * 0.013),
                        child: Column(
                          children: [OneComment(i), commentsDivider()],
                        ),
                      )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
