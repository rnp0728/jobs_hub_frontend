class CustomMap {
  final Map<String, dynamic> map;
  const CustomMap({this.map = const {}});

  operator [](String? key) {
    if (map.keys.contains(key)) {
      return map[key];
    }
    return null;
  }

  CustomMap copyWith({required String key, required dynamic value}) {
    Map<String, dynamic> newMap = Map.fromEntries(map.entries);
    newMap[key] = value;
    return CustomMap(map: newMap);
  }
}
