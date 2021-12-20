import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:rudder_sdk_flutter/RudderClient.dart';

void registerPlugins(Registrar registrar) {
  RudderClient.registerWith(registrar);
  registrar.registerMessageHandler();
}
