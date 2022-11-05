import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/shared/models/flat.dart';

class ExportFlat extends Flat {
  int pricePerSqMeter;
  ExportFlat({
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
    required this.pricePerSqMeter,
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

  factory ExportFlat.fromImport(InputFlat flat, int meterPrice) {
    return ExportFlat(
        position: flat.position,
        roomsCount: flat.roomsCount,
        segment: flat.segment,
        floorsInHouse: flat.floorsInHouse,
        wallsMaterial: flat.wallsMaterial,
        flatFloor: flat.flatFloor,
        flatArea: flat.flatArea,
        kitchenArea: flat.kitchenArea,
        hasBalcony: flat.hasBalcony,
        distanceFromMetro: flat.distanceFromMetro,
        condition: flat.condition,
        pricePerSqMeter: meterPrice);
  }
}
