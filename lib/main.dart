import "package:flutter/material.dart";
import 'navigator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: IsaNavigator()
    );
  }
}
