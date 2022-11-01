import 'dart:convert';

import 'package:mos_estate/shared/constants/parameters.dart';

class Analogue {
  Map<Parameter, double?> ratios = {
    Parameter.floor: null,
    Parameter.flatArea: null,
    Parameter.kitchenArea: null,
    Parameter.hasBalcony: null,
    Parameter.distanceFromMetro: null,
    Parameter.condition: null,
  };

  bool selected = true;

  Map<Parameter, RatioCoordinates> ratiosCoordinates;
  int price;
  Coordinates coordinates;

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

  Analogue({
    required this.ratiosCoordinates,
    required this.price,
    required this.coordinates,
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

  Map<String, dynamic> toMap() {
    return {
      'ratiosCoordinates': ratiosCoordinates,
      'price': price,
      'coordinates': coordinates.toMap(),
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

  factory Analogue.fromMap(Map<String, dynamic> map) {
    return Analogue(
      ratiosCoordinates: Map<Parameter, RatioCoordinates>.from(map['ratiosCoordinates']),
      price: map['price']?.toInt() ?? 0,
      coordinates: Coordinates.fromMap(map['coordinates']),
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

  factory Analogue.fromJson(String source) => Analogue.fromMap(json.decode(source));
}

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) => Coordinates.fromMap(json.decode(source));
}

class RatioCoordinates {
  int row;
  int column;

  RatioCoordinates({
    required this.row,
    required this.column,
  });

  Map<String, dynamic> toMap() {
    return {
      'row': row,
      'column': column,
    };
  }

  factory RatioCoordinates.fromMap(Map<String, dynamic> map) {
    return RatioCoordinates(
      row: map['row']?.toInt() ?? 0,
      column: map['column']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatioCoordinates.fromJson(String source) => RatioCoordinates.fromMap(json.decode(source));
}
