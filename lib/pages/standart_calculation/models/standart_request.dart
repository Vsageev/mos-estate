import 'dart:convert';

import 'package:mos_estate/pages/import/input_flat.dart';

class StandartRequest {
  String address;
  String room;
  String segment;
  int maxFloor;
  String material;
  int correctFloor;
  double correctArea;
  double correctKitchenArea;
  String correctBalcony;
  int correctMetroTime;
  String correctStatusFinish;
  StandartRequest({
    required this.address,
    required this.room,
    required this.segment,
    required this.maxFloor,
    required this.material,
    required this.correctFloor,
    required this.correctArea,
    required this.correctKitchenArea,
    required this.correctBalcony,
    required this.correctMetroTime,
    required this.correctStatusFinish,
  });

  factory StandartRequest.fromInput(InputFlat flat) {
    return StandartRequest(
      address: flat.position,
      room: flat.roomsCount,
      segment: flat.segment,
      maxFloor: flat.floorsInHouse,
      material: flat.wallsMaterial,
      correctFloor: flat.flatFloor,
      correctArea: flat.flatArea,
      correctKitchenArea: flat.kitchenArea,
      correctBalcony: flat.hasBalcony,
      correctMetroTime: flat.distanceFromMetro,
      correctStatusFinish: flat.condition,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'room': room,
      'segment': segment,
      'maxFloor': maxFloor,
      'material': material,
      'correctFloor': correctFloor,
      'correctArea': correctArea,
      'correctKitchenArea': correctKitchenArea,
      'correctBalcony': correctBalcony,
      'correctMetroTime': correctMetroTime,
      'correctStatusFinish': correctStatusFinish,
    };
  }

  factory StandartRequest.fromMap(Map<String, dynamic> map) {
    return StandartRequest(
      address: map['address'] ?? '',
      room: map['room'] ?? '',
      segment: map['segment'] ?? '',
      maxFloor: map['maxFloor']?.toInt() ?? 0,
      material: map['material'] ?? '',
      correctFloor: map['correctFloor']?.toInt() ?? 0,
      correctArea: map['correctArea']?.toInt() ?? 0,
      correctKitchenArea: map['correctKitchenArea']?.toInt() ?? 0,
      correctBalcony: map['correctBalcony'] ?? '',
      correctMetroTime: map['correctMetroTime']?.toInt() ?? 0,
      correctStatusFinish: map['correctStatusFinish'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StandartRequest.fromJson(String source) => StandartRequest.fromMap(json.decode(source));
}
