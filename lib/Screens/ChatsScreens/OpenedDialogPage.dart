import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/UI/UIHelpers.dart';
import 'package:isa_new/models/chatModels/ChatModel.dart';

class OpenedDialogPage extends UIItem {
  ChatModel chat;

  OpenedDialogPage(this.chat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(
              top: displayHeight(context) * 0.03,
              left: displayWidth(context) * 0.03),
          child: backButton(),
        ),
        title: Container(
          margin: EdgeInsets.only(left: displayWidth(context) * 0.12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(displayWidth(context) * 0.12),
                  child: Image.network(
                    chat.userImg,
                    fit: BoxFit.fill,
                    height: displayHeight(context) * 0.055,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: displayWidth(context) * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        chat.userName,
                        style: UITypography.h3(context),
                      ),
                    ),
                    Container(
                      child: Text(
                        chat.lastOnline,
                        style: UITypography.h4(context,
                            color: UIColors.disabled, weight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [Text("PIZDA")],
      ),
    );
  }
}
