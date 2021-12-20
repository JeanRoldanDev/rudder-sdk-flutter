import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:rudder_sdk_flutter/RudderConfig.dart';
import 'package:rudder_sdk_flutter/RudderController.dart';
import 'package:rudder_sdk_flutter/RudderOption.dart';
import 'package:rudder_sdk_flutter/RudderProperty.dart';
import 'package:rudder_sdk_flutter/RudderTraits.dart';
import 'package:rudder_sdk_flutter/connectjs/register_with.dart';

class RudderClient {
  RudderClient._();
  static RudderController get instance => RudderController.instance;

  static Future<void> Function(Registrar) get registerWith =>
      Register.registerWith;

  @Deprecated('Use instance.initialize instead')
  static void getInstance(String writeKey,
      {RudderConfig? config, RudderOption? options}) {
    initialize(writeKey, config: config, options: options);
  }

  @Deprecated('Use instance.initialize instead')
  static void initialize(String writeKey,
      {RudderConfig? config, RudderOption? options}) {
    instance.initialize(writeKey, config: config, options: options);
  }

  @Deprecated('Use instance.identify instead')
  static void identify(String userId,
      {RudderTraits? traits, RudderOption? options}) {
    instance.identify(userId, traits: traits, options: options);
  }

  @Deprecated('Use instance. track instead')
  static void track(
    String eventName, {
    RudderProperty? properties,
    RudderOption? options,
  }) {
    instance.track(eventName, properties: properties, options: options);
  }

  @Deprecated('Use instance  .screen instead')
  static void screen(
    String screenName, {
    RudderProperty? properties,
    RudderOption? options,
  }) {
    instance.screen(screenName, properties: properties, options: options);
  }

  @Deprecated('Use instance.group instead')
  static void group(String groupId,
      {RudderTraits? groupTraits, RudderOption? options}) {
    instance.group(groupId, groupTraits: groupTraits, options: options);
  }

  @Deprecated('Use instance.alias instead')
  static void alias(String newId, {RudderOption? options}) {
    instance.alias(newId, options: options);
  }

  @Deprecated('Use instance.reset instead')
  static void reset() {
    instance.reset();
  }

  @Deprecated('Use instance.optOut instead')
  static void optOut(bool optOut) {
    instance.optOut(optOut);
  }

  @Deprecated('Use [instance.putDeviceToken] instead')
  static void putDeviceToken(String deviceToken) {
    instance.putDeviceToken(deviceToken);
  }

  @Deprecated('Use instance.putAdvertisingId instead')
  static void setAdvertisingId(String advertisingId) {
    putAdvertisingId(advertisingId);
  }

  @Deprecated('Use instance.putAdvertisingId instead')
  static void putAdvertisingId(String advertisingId) {
    instance.putAdvertisingId(advertisingId);
  }

  @Deprecated('Use instance.putAnonymousId instead')
  static void setAnonymousId(String anonymousId) {
    putAnonymousId(anonymousId);
  }

  @Deprecated('Use instance.putAnonymousId instead')
  static void putAnonymousId(String anonymousId) {
    instance.putAnonymousId(anonymousId);
  }

  @Deprecated('Use instance.getRudderContext instead')
  static Future<Map?> getRudderContext() {
    return instance.getRudderContext();
  }
}
