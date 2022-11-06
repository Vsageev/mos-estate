import 'dart:convert';

import 'package:mos_estate/pages/standart_calculation/models/standart_response.dart';
import 'package:mos_estate/shared/constants/parameters.dart';

class Analogue {
  BargainRatio bargainRatio = BargainRatio();
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
  Location coordinates;

  String position;
  int roomsCount;
  String segment;
  int floorsInHouse;
  String wallsMaterial;
  int flatFloor;
  double flatArea;
  double kitchenArea;
  String hasBalcony;
  int distanceFromMetro;
  String condition;
  List<String> imageUrls;

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
    required this.imageUrls,
  });

  factory Analogue.fromResponseAnalogue(StandartResponseAnalogue analogue) {
    return Analogue(
      ratiosCoordinates: {
        Parameter.floor: RatioCoordinates.fromArray(analogue.typeOfFloor),
        Parameter.flatArea: RatioCoordinates.fromArray(analogue.typeOfArea),
        Parameter.kitchenArea: RatioCoordinates.fromArray(analogue.typeOfKitchenArea),
        Parameter.hasBalcony: RatioCoordinates.fromArray(analogue.typeOfBalcony),
        Parameter.distanceFromMetro: RatioCoordinates.fromArray(analogue.typeOfMetroTime),
        Parameter.condition: RatioCoordinates.fromArray(analogue.typeOfStatusFinish),
      },
      price: analogue.price,
      coordinates: analogue.location,
      position: analogue.address,
      roomsCount: analogue.roomsCount,
      segment: analogue.segment,
      floorsInHouse: analogue.maxFloor,
      wallsMaterial: analogue.material,
      flatFloor: analogue.floor,
      flatArea: double.tryParse(analogue.area) ?? 0,
      kitchenArea: double.tryParse(analogue.kitchenArea) ?? 0,
      hasBalcony: analogue.balcony,
      distanceFromMetro: analogue.metroTime,
      condition: analogue.statusFinish,
      imageUrls: analogue.photos,
    );
  }
}

class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lat: double.tryParse(map['lat']) ?? 0.0,
      lng: double.tryParse(map['lng']) ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source));
}

class RatioCoordinates {
  int row;
  int column;

  RatioCoordinates({
    required this.row,
    required this.column,
  });

  factory RatioCoordinates.fromArray(List<int> arr) {
    return RatioCoordinates(
      row: arr[0],
      column: arr[1],
    );
  }

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

extension CoordinatesMapping on Map<Parameter, RatioCoordinates> {
  Map<String, dynamic> toMap() {
    return map((key, value) => MapEntry(key.value, value.toMap()));
  }
}

Map<Parameter, RatioCoordinates> ratioCoordsfromMap(Map<String, dynamic> json) {
  return json.map((key, value) => MapEntry(Parameter.fromValue(key), RatioCoordinates.fromArray(value)));
}

class BargainRatio {
  double? value;
  BargainRatio({
    this.value,
  });
}
