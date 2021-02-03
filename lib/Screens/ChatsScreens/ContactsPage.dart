import 'package:flutter/material.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/blocs/chatBlocs/ContactsBloc.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/UI/ChatsWidgets/chatContact.dart';
import 'file:///D:/AndroidStudioProjects/isa_new/lib/models/chatModels/ChatContactModel.dart';

class ContactPage extends UIItem {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: StreamBuilder(
          stream: contactsBloc.news,
          builder: (context, AsyncSnapshot<List<ChatContactsModel>> snapshot) {
            contactsBloc.fetchNews();
            if (snapshot.hasData) {
              return ListView(
                children: [for (var i in snapshot.data) chatContact(i)],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
