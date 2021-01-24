import 'package:flutter/material.dart';
import 'package:isa_new/UI/UI.dart';
import 'package:isa_new/blocs/chatBlocs/DialogsBloc.dart';
import 'package:isa_new/models/ChatModel.dart';

import 'file:///D:/AndroidStudioProjects/isa_new/lib/UI/ChatsWidgets/chatCard.dart';

class DialogsPage extends UIItem {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: dialogsBlocc.dialogs,
        builder: (context, AsyncSnapshot<List<ChatModel>> snapshot) {
          dialogsBlocc.fetchNews();
          if (snapshot.hasData) {
            return ListView(
              children: [for (var i in snapshot.data) chatCard(i)],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            print(snapshot.data);
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
