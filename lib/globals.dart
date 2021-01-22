library isa_bew.globals;

import 'package:isa_new/api/dart_isa_api.dart';

String _APIToken = "9422082ba359a72f62a9f03f97dfc4c0c9269b15";
isa_api _API = null;

set APIToken(String newToken) {
  _APIToken = newToken;
  _API = isa_api(newToken);
}

isa_api get API => _API;
