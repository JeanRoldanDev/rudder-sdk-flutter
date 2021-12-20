import 'package:rudder_sdk_flutter/RudderIntegration.dart';
import 'package:rudder_sdk_flutter/Utils.dart';

// we left fetching the external ids from the scratch here
class RudderOption {
  List<Map<String, dynamic>>? externalIds;
  Map<String, Object>? integrations;

  RudderOption putExternalId(String type, String id) {
    externalIds ??= [];

    Map<String, Object>? externalIdMap;
    var mapIndex = -1;
    for (var index = 0; index < externalIds!.length; index++) {
      final map = externalIds!.elementAt(index) as Map<String, Object>;
      final mapType = map['type'].toString();
      if (Utils.equalsIgnoreCase(mapType, type)) {
        externalIdMap = map;
        mapIndex = index;
        break;
      }
    }

    // if not present from previous runs: create new and assign the type
    if (externalIdMap == null) {
      externalIdMap = {};
      externalIdMap['type'] = type;
    }

    // assign new id or update existing id
    externalIdMap['id'] = id;

    // finally update existing position or add new id
    if (mapIndex == -1) {
      // not found in existing storage
      externalIds!.add(externalIdMap);
    } else {
      externalIds!.elementAt(mapIndex)['id'] = id;
    }

    // return for builder pattern
    return this;
  }

  RudderOption putIntegration(String type, bool enabled) {
    integrations ??= {};
    integrations![type] = enabled;
    return this;
  }

  RudderOption putIntegrationWithFactory(
      RudderIntegration factory, bool enabled) {
    integrations ??= {};
    integrations![factory.getKey()] = enabled;
    return this;
  }

  Map<String, Object> toMap() {
    final optionsMap = <String, Object>{};
    if (externalIds != null) {
      optionsMap['externalIds'] = externalIds!;
    }
    optionsMap['integrations'] = integrations ?? {};
    return optionsMap;
  }
}
