import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/pages/standart_calculation/standart.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_states.dart';
import 'package:mos_estate/requests/standart_requests.dart';
import 'package:mos_estate/shared/constants/parameters.dart';

class StandartCalculationCubit extends Cubit<StandartCalculationState> {
  StandartCalculationCubit(InputFlat standart) : super(StandartCalculationLoading()) {
    getAnalogues(standart);
  }

  BargainRatio bargainRatio = BargainRatio(value: -0.045);
  Map<Parameter, Ratios> ratios = {
    Parameter.floor: Ratios.creteStandart(parameter: Parameter.floor),
    Parameter.flatArea: Ratios.creteStandart(parameter: Parameter.flatArea),
    Parameter.kitchenArea: Ratios.creteStandart(parameter: Parameter.kitchenArea),
    Parameter.hasBalcony: Ratios.creteStandart(parameter: Parameter.hasBalcony),
    Parameter.distanceFromMetro: Ratios.creteStandart(parameter: Parameter.distanceFromMetro),
    Parameter.condition: Ratios.creteStandart(parameter: Parameter.condition),
  };

  getAnalogues(InputFlat flat) async {
    // final List<Analogue> analogues = [
    //   Analogue(
    //       ratiosCoordinates: {
    //         Parameter.floor: RatioCoordinates(row: 1, column: 0),
    //         Parameter.flatArea: RatioCoordinates(row: 0, column: 0),
    //         Parameter.kitchenArea: RatioCoordinates(row: 0, column: 0),
    //         Parameter.hasBalcony: RatioCoordinates(row: 0, column: 1),
    //         Parameter.distanceFromMetro: RatioCoordinates(row: 0, column: 1),
    //         Parameter.condition: RatioCoordinates(row: 2, column: 2),
    //       },
    //       price: 2000000,
    //       coordinates: Location(lat: 55.7607139, lng: 37.6006965),
    //       position: "г. Москва, ул. Ватутина, д. 275",
    //       roomsCount: 2,
    //       segment: "Новостройка",
    //       floorsInHouse: 8,
    //       wallsMaterial: "Кирпич",
    //       flatFloor: 3,
    //       flatArea: 58,
    //       kitchenArea: 12,
    //       hasBalcony: "Да",
    //       distanceFromMetro: 10,
    //       condition: "Без ремонта")
    // ];

    // final standart = Standart(
    //   position: "г. Москва, ул. Ватутина, д. 275",
    //   roomsCount: "2",
    //   segment: "Новостройка",
    //   floorsInHouse: 8,
    //   wallsMaterial: "Кирпич",
    //   flatFloor: 3,
    //   flatArea: 100,
    //   kitchenArea: 12,
    //   hasBalcony: "Да",
    //   distanceFromMetro: 10,
    //   condition: "Без ремонта",
    //   coordinates: Location(lat: 55.7607139, lng: 37.6006965),
    // );

    // emit(StandartCalculationLoaded(analogues: analogues, standart: standart));

    final resp = await StandartRequests.getAnalogues(flat);

    final Standart standart = Standart.fromResponseStandart(resp.standard);

    final List<Analogue> analogues = resp.analogs.map((e) => Analogue.fromResponseAnalogue(e)).toList();

    emit(StandartCalculationLoaded(analogues: analogues, standart: standart));
  }

  update() {
    if (state is StandartCalculationLoaded) {
      emit(StandartCalculationLoaded(
          analogues: (state as StandartCalculationLoaded).analogues,
          standart: (state as StandartCalculationLoaded).standart));
    }
  }
}
