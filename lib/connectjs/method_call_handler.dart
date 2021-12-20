import 'dart:convert';
import 'dart:developer';
import 'dart:js' as js;

import 'package:flutter/services.dart';

import 'package:rudder_sdk_flutter/connectjs/interop.dart';

part 'method_call_js.dart';

mixin HandleMethodCall {
  Future<dynamic> handleMethodCall(MethodCall call) async {
    log('handleMethodCall');
    switch (call.method) {
      case 'initializeSDK':
        log('handleMethodCall initializeSDK');
        await initializeSDK(call);
        break;
      case 'track':
        await sendTrack(call);
        break;
      case 'identify':
        await setIdentify(call);
        break;
      case 'screen':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'screen is not implemented on the web',
        );
      case 'group':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'group is not implemented on the web',
        );
      case 'alias':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'alias is not implemented on the web',
        );
      case 'reset':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'reset is not implemented on the web',
        );
      case 'optOut':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'optOut is not implemented on the web',
        );
      case 'deviceToken':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'deviceToken is not implemented on the web',
        );
      case 'advertisingId':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'advertisingId is not implemented on the web',
        );
      case 'putAdvertisingId':
        throw PlatformException(
          code: 'Unimplemented',
          message: 'putAdvertisingId is not implemented on the web',
        );
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: "rudder_sdk_web for web doesn't implement '${call.method}",
        );
    }
  }
}
