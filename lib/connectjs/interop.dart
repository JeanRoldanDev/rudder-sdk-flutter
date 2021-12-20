// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:collection';
import 'dart:convert';
import 'dart:html' as html;

class Interop {
  static const nameChanel = 'rudder_sdk_flutter';

  static Future<void> loadScriptRudderStackSDK() async {
    final head = html.querySelector('head')!;
    final scriptTag = _createScriptTag(
        './assets/packages/rudder_sdk_flutter/web/analytics.js');
    final scripts = head.children.where((element) => element.id == 'analytics');
    if (scripts.isEmpty) {
      head.children.add(scriptTag);
      await scriptTag.onLoad.first;
    }
  }

  static html.ScriptElement _createScriptTag(String library) {
    final script = html.ScriptElement()
      ..type = 'text/javascript'
      ..charset = 'utf-8'
      ..id = 'analytics'
      ..async = true
      ..src = library;
    return script;
  }

  static Map<String, dynamic> linkedMapToMap(
      LinkedHashMap<dynamic, dynamic> linkedMap) {
    return json.decode(json.encode(linkedMap)) as Map<String, dynamic>;
  }
}
