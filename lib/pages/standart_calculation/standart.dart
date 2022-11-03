import 'dart:convert';

import 'package:mos_estate/pages/standart_calculation/analogue.dart';

class Standart {
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

  Coordinates coordinates;

  Standart({
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
    required this.coordinates,
  });

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
