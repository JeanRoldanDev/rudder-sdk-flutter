import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:rudder_sdk_flutter/RudderClient.dart';

import 'package:rudder_sdk_flutter/connectjs/interop.dart';

class Register {
  static Future<void> registerWith(Registrar registrar) async {
    final channel = MethodChannel(
      Interop.nameChanel,
      const StandardMethodCodec(),
      registrar,
    );
    await Interop.loadScriptRudderStackSDK();
    final pluginInstance = RudderClient.instance;
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
    log('registerWith rudder_sdk_web');
  }
}
