import 'dart:convert';

import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/shared/models/flat.dart';

class Standart extends Flat {
  Coordinates coordinates;

  Standart({
    required String position,
    required int roomsCount,
    required String segment,
    required int floorsInHouse,
    required String wallsMaterial,
    required int flatFloor,
    required int flatArea,
    required int kitchenArea,
    required String hasBalcony,
    required int distanceFromMetro,
    required String condition,
    required this.coordinates,
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
      'coordinates': coordinates.toMap(),
    };
  }

  factory Standart.fromMap(Map<String, dynamic> map) {
    return Standart(
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
      coordinates: Coordinates.fromMap(map['coordinates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Standart.fromJson(String source) => Standart.fromMap(json.decode(source));
}
