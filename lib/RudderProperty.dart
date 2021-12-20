class RudderProperty {
  RudderProperty();

  RudderProperty.fromMap(Map<String, dynamic> map) : _map = map;

  RudderProperty.putValue({
    String? key,
    dynamic value,
    Map<String, dynamic>? map,
  }) {
    if (map != null) {
      _map.addAll(map);
    }
    if (key != null) {
      if (value is RudderProperty) {
        _map[key] = value.getMap();
      } else {
        _map[key] = value;
      }
    }
  }
  var _map = <String, dynamic>{};

  Map<String, dynamic> getMap() => _map;

  bool hasProperty(String key) => _map.containsKey(key);

  void put(String key, dynamic value) => _map[key] = value;

  void putRevenue(double revenue) => _map['revenue'] = revenue;

  void putCurrency(String currency) => _map['currency'] = currency;
}
