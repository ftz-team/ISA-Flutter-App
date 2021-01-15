library isa_bew.globals;

import 'package:isa_new/api/dart_isa_api.dart';

String _APIToken = "";
isa_api _API = null;

set APIToken(String newToken) {
  _APIToken = newToken;
  _API = isa_api(newToken);
}

isa_api get API => _API;
