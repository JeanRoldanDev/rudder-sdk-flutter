import 'package:flutter/services.dart';
import 'package:rudder_sdk_flutter/RudderConfig.dart';
import 'package:rudder_sdk_flutter/RudderOption.dart';
import 'package:rudder_sdk_flutter/RudderProperty.dart';
import 'package:rudder_sdk_flutter/RudderTraits.dart';
import 'package:rudder_sdk_flutter/connectjs/interop.dart';
import 'package:rudder_sdk_flutter/connectjs/method_call_handler.dart';

class RudderController with HandleMethodCall {
  RudderController._();
  static final RudderController _instance = RudderController._();
  static RudderController get instance => _instance;

  final _platformChannel = const MethodChannel(Interop.nameChanel);

  void initialize(
    String writeKey, {
    RudderConfig? config,
    RudderOption? options,
  }) {
    config ??= RudderConfig();
    final params = <String, dynamic>{
      'writeKey': writeKey,
      'config': config.toMap(),
      if (options != null) 'options': options.toMap(),
    };
    _platformChannel.invokeMethod('initializeSDK', params);
  }

  void identify(String userId, {RudderTraits? traits, RudderOption? options}) {
    final params = <String, dynamic>{
      'userId': userId,
      if (traits != null) 'traits': traits.traitsMap,
      if (options != null) 'options': options.toMap(),
    };
    _platformChannel.invokeMethod('identify', params);
  }

  void track(
    String eventName, {
    RudderProperty? properties,
    RudderOption? options,
  }) {
    final params = <String, dynamic>{
      'eventName': eventName,
      if (properties != null) 'properties': properties.getMap(),
      if (options != null) 'options': options.toMap(),
    };
    _platformChannel.invokeMethod('track', params);
  }

  void screen(
    String screenName, {
    RudderProperty? properties,
    RudderOption? options,
  }) {
    final params = <String, dynamic>{
      'screenName': screenName,
      if (properties != null) 'properties': properties.getMap(),
      if (options != null) 'options': options.toMap(),
    };
    _platformChannel.invokeMethod('screen', params);
  }

  void group(
    String groupId, {
    RudderTraits? groupTraits,
    RudderOption? options,
  }) {
    final params = <String, dynamic>{
      'groupId': groupId,
      if (groupTraits != null) 'groupTraits': groupTraits.traitsMap,
      if (options != null) 'options': options.toMap(),
    };
    _platformChannel.invokeMethod('group', params);
  }

  void alias(String newId, {RudderOption? options}) {
    final params = <String, dynamic>{
      'newId': newId,
      if (options != null) 'options': options.toMap(),
    };
    _platformChannel.invokeMethod('alias', params);
  }

  void reset() {
    _platformChannel.invokeMethod('reset');
  }

  void optOut(bool optOut) {
    final params = <String, dynamic>{
      'optOut': optOut,
    };
    _platformChannel.invokeMethod('optOut', params);
  }

  void putDeviceToken(String deviceToken) {
    final params = <String, dynamic>{
      'deviceToken': deviceToken,
    };
    _platformChannel.invokeMethod('putDeviceToken', params);
  }

  void putAdvertisingId(String advertisingId) {
    final params = <String, dynamic>{
      'advertisingId': advertisingId,
    };
    _platformChannel.invokeMethod('putAdvertisingId', params);
  }

  void putAnonymousId(String anonymousId) {
    final params = <String, dynamic>{
      'anonymousId': anonymousId,
    };
    _platformChannel.invokeMethod('putAnonymousId', params);
  }

  Future<Map?> getRudderContext() async {
    return await _platformChannel.invokeMethod('getRudderContext') as Map?;
  }
}
