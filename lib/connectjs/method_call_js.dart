part of 'method_call_handler.dart';

Future<void> initializeSDK(MethodCall call) async {
  final arg = Interop.linkedMapToMap(call.arguments);
  final writeKey = arg['writeKey'] as String;
  final config = arg['config'] as Map<String, dynamic>;
  final dataPlaneUrl = config['dataPlaneUrl'] as String;
  js.context.callMethod('initializeSDK', [writeKey, dataPlaneUrl]);
}

Future<void> sendTrack(MethodCall call) async {
  final arg = Interop.linkedMapToMap(call.arguments);
  final eventName = arg['eventName'] as String;
  final properties = arg['properties'] as Map<String, dynamic>;
  final options = arg['options'] as Map<String, dynamic>;
  js.context.callMethod('trackEvent', [
    eventName,
    json.encode(properties).toString(),
    json.encode(options),
  ]);
}

Future<void> setIdentify(MethodCall call) async {
  final arg = Interop.linkedMapToMap(call.arguments);
  final userId = arg['userId'] as String;
  final traits = arg['traits'] as Map<String, dynamic>;
  js.context.callMethod('identify', [
    userId,
    json.encode(traits).toString(),
  ]);
}
