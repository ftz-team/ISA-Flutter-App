import 'package:flutter/material.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/models/ChatContactModel.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/UI/ChatsWidgets/chatContact.dart';

class ContactPage extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: chatContact(ChatContactsModel.fromJson({
        "uid": 12,
        "username": "Артём Смирнов",
        "active": false,
        "last_online": "13:06",
        "asset":
            "https://wl-brightside.cf.tsp.li/resize/728x/jpg/f6e/ef6/b5b68253409b796f61f6ecd1f1.jpg"
      })),
    );
  }
}
