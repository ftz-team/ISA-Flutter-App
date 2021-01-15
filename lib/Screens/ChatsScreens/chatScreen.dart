import 'package:flutter/material.dart';
import 'package:isa_new/Screens/ChatsScreens/ContactsPage.dart';
import 'package:isa_new/Screens/ChatsScreens/DialogsPage.dart';
import 'package:isa_new/UI/UI.dart';

class chatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWithTabs(
        ["Диалоги", "Контакты"], [DialogsPage(), ContactPage()], "Чат");
  }
}
