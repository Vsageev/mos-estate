import 'dart:convert';

import 'package:mos_estate/pages/standart_calculation/analogue.dart';

class StandartResponse {
  List<StandartResponseAnalogue> analogs;
  StandartResponseStandart standard;
  StandartResponse({
    required this.standard,
    required this.analogs,
  });

  factory StandartResponse.fromMap(Map<String, dynamic> map) {
    return StandartResponse(
      analogs: List<StandartResponseAnalogue>.from(map['analogs']?.map((x) => StandartResponseAnalogue.fromMap(x))),
      standard: StandartResponseStandart.fromMap(map['standard']),
    );
  }

  factory StandartResponse.fromJson(String source) => StandartResponse.fromMap(json.decode(source));
}

class StandartResponseStandart {
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
  Location location;
  StandartResponseStandart({
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
    required this.location,
  });

  factory StandartResponseStandart.fromMap(Map<String, dynamic> map) {
    return StandartResponseStandart(
      address: map['address'] ?? '',
      room: map['room'] ?? '',
      segment: map['segment'] ?? '',
      maxFloor: map['maxFloor']?.toInt() ?? 0,
      material: map['material'] ?? '',
      correctFloor: map['correctFloor']?.toInt() ?? 0,
      correctArea: map['correctArea']?.toDouble() ?? 0.0,
      correctKitchenArea: map['correctKitchenArea']?.toDouble() ?? 0.0,
      correctBalcony: map['correctBalcony'] ?? '',
      correctMetroTime: map['correctMetroTime']?.toInt() ?? 0,
      correctStatusFinish: map['correctStatusFinish'] ?? '',
      location: Location.fromMap(map['location']),
    );
  }

  factory StandartResponseStandart.fromJson(String source) => StandartResponseStandart.fromMap(json.decode(source));
}

class StandartResponseAnalogue {
  String address;
  String area;
  String balcony;
  int floor;
  String kitchenArea;
  Location location;
  String material;
  int maxFloor;
  int metroTime;
  int price;
  int roomsCount;
  String segment;
  List<int> typeOfArea;
  List<int> typeOfBalcony;
  List<int> typeOfFloor;
  List<int> typeOfKitchenArea;
  List<int> typeOfMetroTime;
  List<int> typeOfStatusFinish;
  StandartResponseAnalogue({
    required this.address,
    required this.area,
    required this.balcony,
    required this.floor,
    required this.kitchenArea,
    required this.location,
    required this.material,
    required this.maxFloor,
    required this.metroTime,
    required this.price,
    required this.roomsCount,
    required this.segment,
    required this.typeOfArea,
    required this.typeOfBalcony,
    required this.typeOfFloor,
    required this.typeOfKitchenArea,
    required this.typeOfMetroTime,
    required this.typeOfStatusFinish,
  });

  factory StandartResponseAnalogue.fromMap(Map<String, dynamic> map) {
    return StandartResponseAnalogue(
      address: map['address'] ?? '',
      area: map['area'] ?? '',
      balcony: map['balcony'] ?? '',
      floor: map['floor']?.toInt() ?? 0,
      kitchenArea: map['kitchenArea'] ?? '',
      location: Location.fromMap(map['location']),
      material: map['material'] ?? '',
      maxFloor: map['maxFloor']?.toInt() ?? 0,
      metroTime: map['metroTime']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      roomsCount: map['roomsCount']?.toInt() ?? 0,
      segment: map['segment'] ?? '',
      typeOfArea: List<int>.from(map['typeOfArea']),
      typeOfBalcony: List<int>.from(map['typeOfBalcony']),
      typeOfFloor: List<int>.from(map['typeOfFloor']),
      typeOfKitchenArea: List<int>.from(map['typeOfKitchenArea']),
      typeOfMetroTime: List<int>.from(map['typeOfMetroTime']),
      typeOfStatusFinish: List<int>.from(map['typeOfStatusFinish']),
    );
  }

  factory StandartResponseAnalogue.fromJson(String source) => StandartResponseAnalogue.fromMap(json.decode(source));
}
