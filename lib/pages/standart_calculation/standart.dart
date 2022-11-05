import 'dart:convert';

import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/models/standart_response.dart';
import 'package:mos_estate/shared/models/flat.dart';

class Standart extends Flat {
  Location coordinates;

  Standart({
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

  factory Standart.fromResponseStandart(StandartResponseStandart standart) {
    return Standart(
      position: standart.address,
      roomsCount: standart.room,
      segment: standart.segment,
      floorsInHouse: standart.maxFloor,
      wallsMaterial: standart.material,
      flatFloor: standart.correctFloor,
      flatArea: standart.correctArea,
      kitchenArea: standart.correctKitchenArea,
      hasBalcony: standart.correctBalcony,
      distanceFromMetro: standart.correctMetroTime,
      condition: standart.correctStatusFinish,
      coordinates: standart.location,
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
      coordinates: Location.fromMap(map['coordinates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Standart.fromJson(String source) => Standart.fromMap(json.decode(source));
}
