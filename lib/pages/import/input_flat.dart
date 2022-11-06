import 'dart:convert';

import 'package:excel/excel.dart';
import 'package:mos_estate/shared/models/flat.dart';

class InputFlat extends Flat {
  InputFlat({
    required String position,
    required String roomsCount,
    required String segment,
    required int floorsInHouse,
    required String wallsMaterial,
    required int flatFloor,
    required double flatArea,
    required double kitchenArea,
    required String hasBalcony,
    required int distanceFromMetro,
    required String condition,
  }) : super(
            position: position,
            roomsCount: roomsCount,
            segment: segment,
            floorsInHouse: floorsInHouse,
            wallsMaterial: wallsMaterial,
            flatFloor: flatFloor,
            flatArea: flatArea,
            kitchenArea: kitchenArea,
            hasBalcony: hasBalcony,
            distanceFromMetro: distanceFromMetro,
            condition: condition);

  factory InputFlat.fromRow(List<Data?> row) {
    return InputFlat(
      position: (row[0]?.value ?? "").toString(),
      roomsCount: (row[1]?.value).toString(),
      segment: row[2]?.value,
      floorsInHouse: row[3]?.value,
      wallsMaterial: row[4]?.value,
      flatFloor: row[5]?.value,
      flatArea: row[6]?.value,
      kitchenArea: row[7]?.value,
      hasBalcony: row[8]?.value,
      distanceFromMetro: row[9]?.value,
      condition: row[10]?.value,
    );
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
