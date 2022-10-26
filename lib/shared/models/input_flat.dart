import 'dart:convert';

import 'package:excel/excel.dart';

class InputFlat {
  String position;
  int roomsCount;
  String segment;
  int floorsInHouse;
  String wallsMaterial;
  int flatFloor;
  int flatArea;
  int kitchenArea;
  bool hasBalcony;
  double distanceFromMetro;
  String condition;
  InputFlat({
    required this.position,
    required this.roomsCount,
    required this.segment,
    required this.floorsInHouse,
    required this.wallsMaterial,
    required this.flatFloor,
    required this.flatArea,
    required this.kitchenArea,
    required this.hasBalcony,
    required this.distanceFromMetro,
    required this.condition,
  });

  factory InputFlat.fromRow(List<Data?> row) {
    return InputFlat(
      position: (row[0]?.value ?? "").toString(),
      roomsCount: row[1]?.value,
      segment: row[2]?.value,
      floorsInHouse: row[3]?.value,
      wallsMaterial: row[4]?.value,
      flatFloor: row[5]?.value,
      flatArea: row[6]?.value,
      kitchenArea: row[7]?.value,
      hasBalcony: _getBool(row[8]?.value.toString() ?? ""),
      distanceFromMetro: (row[9]?.value as int).toDouble(),
      condition: row[10]?.value,
    );
  }

  static bool _getBool(String str) {
    return str == "Да" ? true : false;
  }

  Map<String, dynamic> toMap() {
    return {
      'position': position,
      'roomsCount': roomsCount,
      'segment': segment,
      'floorsInHouse': floorsInHouse,
      'wallsMaterial': wallsMaterial,
      'flatFloor': flatFloor,
      'flatArea': flatArea,
      'kitchenArea': kitchenArea,
      'hasBalcony': hasBalcony,
      'distanceFromMetro': distanceFromMetro,
      'condition': condition,
    };
  }

  factory InputFlat.fromMap(Map<String, dynamic> map) {
    return InputFlat(
      position: map['position'] ?? '',
      roomsCount: map['roomsCount']?.toInt() ?? 0,
      segment: map['segment'] ?? '',
      floorsInHouse: map['floorsInHouse']?.toInt() ?? 0,
      wallsMaterial: map['wallsMaterial'] ?? '',
      flatFloor: map['flatFloor']?.toInt() ?? 0,
      flatArea: map['flatArea']?.toInt() ?? 0,
      kitchenArea: map['kitchenArea']?.toInt() ?? 0,
      hasBalcony: map['hasBalcony'] ?? false,
      distanceFromMetro: map['distanceFromMetro']?.toDouble() ?? 0.0,
      condition: map['condition'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InputFlat.fromJson(String source) => InputFlat.fromMap(json.decode(source));
}
