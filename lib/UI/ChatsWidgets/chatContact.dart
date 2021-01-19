import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/ChatsWidgets/OtherChatsWidgets.dart';
import 'package:isa_new/models/ChatContactModel.dart';

import '../UI.dart';

class chatContact extends UIItem {
  ChatContactsModel contact;

  chatContact(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: displayHeight(context) * 0.013,
          left: displayWidth(context) * 0.025,
          right: displayWidth(context) * 0.025),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: chatCardImage(contact.asset),
              ),
              Expanded(
                  flex: 10,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: displayWidth(context) * 0.036),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        chatCardHeader(contact.nickName),
                        !contact.active
                            ? chatContactLastOnline(contact.lastOnline)
                            : chatContactActive()
                      ],
                    ),
                  ))
            ],
          ),
          ChatCardDivider()
        ],
      ),
    );
  }
}

class chatContactActive extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "В сети",
        style: TextStyle(
            color: UIColors.primary,
            fontWeight: FontWeight.w500,
            fontFamily: font,
            fontSize: displayWidth(context) * 0.035),
      ),
    );
  }
}

class chatContactLastOnline extends UIItem {
  String text;

  chatContactLastOnline(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: displayHeight(context) * 0.006),
      child: Text(
        "был(а) в " + text,
        style: TextStyle(
            color: Color(0xff515151),
            fontFamily: font,
            fontSize: displayWidth(context) * 0.035,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
