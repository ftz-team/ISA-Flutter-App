import 'package:device_preview/device_preview.dart';
import "package:flutter/material.dart";

import 'globals.dart' as globals;
import 'navigator.dart';

final kReleaseMode = true;

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => new MyApp(), //remove on prod
      ),
    )
;

class MyApp extends StatelessWidget {
  MyApp() {
    globals.APIToken = "9422082ba359a72f62a9f03f97dfc4c0c9269b15";
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        locale: DevicePreview.locale(context), //remove on prod
        builder: DevicePreview.appBuilder, //remove on prod
        home: IsaNavigator());
  }
}
