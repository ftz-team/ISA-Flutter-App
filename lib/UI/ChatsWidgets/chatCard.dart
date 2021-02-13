import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isa_new/Helpers/sizeHelpers.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/models/chatModels/ChatModel.dart';

import 'OtherChatsWidgets.dart';

class chatCard extends UIItem {
  ChatModel chat;

  chatCard(this.chat);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: 100,
          height: displayHeight(context) * 0.1,
        ),
        Container(
            decoration: BoxDecoration(color: UIColors.defaultBackground),
            margin: EdgeInsets.only(
                left: displayWidth(context) * 0.025,
                right: displayWidth(context) * 0.025),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ChatCardDate(chat.lastMsgTime),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: chatCardImage(chat.userImg),
                        ),
                        Expanded(
                            flex: 10,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: displayWidth(context) * 0.036),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  chatCardHeader(chat.userName),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: displayHeight(context) * 0.005),
                                      child: Row(
                                        children: [
                                          chatCardStatus(chat.readed),
                                          chatCardLastMsg(chat.lastMsg)
                                        ],
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                    ChatCardDivider(),
                  ],
                ),
              ],
            ))
      ],
    );
  }
}
