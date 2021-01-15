import 'package:flutter/material.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/models/ChatModel.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/UI/ChatsWidgets/chatCard.dart';

class DialogsPage extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: chatCard(ChatModel.fromJson({
      "username": "Артём Смирнов",
      "lastMsg": "Представляешь, не ожидал что стану супер крутым",
      "lastMsgTime": "11:50",
      "readed": false,
      "userImg":
          "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg",
    })));
  }
}
