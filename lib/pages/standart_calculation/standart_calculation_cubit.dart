import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_states.dart';
import 'package:mos_estate/shared/constants/parameters.dart';

class StandartCalculationCubit extends Cubit<StandartCalculationState> {
  StandartCalculationCubit() : super(StandartCalculationLoading()) {
    getAnalogues();
  }

  Map<Parameter, Ratios> ratios = {
    Parameter.floor: Ratios.creteStandart(parameter: Parameter.floor),
    Parameter.flatArea: Ratios.creteStandart(parameter: Parameter.flatArea),
    Parameter.kitchenArea: Ratios.creteStandart(parameter: Parameter.kitchenArea),
    Parameter.hasBalcony: Ratios.creteStandart(parameter: Parameter.hasBalcony),
    Parameter.distanceFromMetro: Ratios.creteStandart(parameter: Parameter.distanceFromMetro),
    Parameter.condition: Ratios.creteStandart(parameter: Parameter.condition),
  };

  getAnalogues() {
    final List<Analogue> analogues = [
      Analogue(
          ratiosCoordinates: {
            Parameter.floor: RatioCoordinates(row: 0, column: 0),
            Parameter.flatArea: RatioCoordinates(row: 0, column: 0),
            Parameter.kitchenArea: RatioCoordinates(row: 0, column: 0),
            Parameter.hasBalcony: RatioCoordinates(row: 0, column: 0),
            Parameter.distanceFromMetro: RatioCoordinates(row: 0, column: 0),
            Parameter.condition: RatioCoordinates(row: 0, column: 0),
          },
          price: 200000,
          coordinates: Coordinates(lat: 55.7607139, lng: 37.6006965),
          position: "г. Москва, ул. Ватутина, д. 275",
          roomsCount: 2,
          segment: "Новостройка",
          floorsInHouse: 8,
          wallsMaterial: "Кирпич",
          flatFloor: 3,
          flatArea: 58,
          kitchenArea: 12,
          hasBalcony: true,
          distanceFromMetro: 10,
          condition: "Без ремонта")
    ];

    emit(StandartCalculationLoaded(analogues: analogues));
  }

  update() {
    if (state is StandartCalculationLoaded) {
      emit(StandartCalculationLoaded(analogues: (state as StandartCalculationLoaded).analogues));
    }
  }
}
