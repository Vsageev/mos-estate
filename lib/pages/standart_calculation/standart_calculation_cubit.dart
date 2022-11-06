import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/pages/standart_calculation/standart.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_states.dart';
import 'package:mos_estate/requests/standart_requests.dart';
import 'package:mos_estate/shared/constants/parameters.dart';
import 'package:mos_estate/shared/services/login_service.dart';

class StandartCalculationCubit extends Cubit<StandartCalculationState> {
  StandartCalculationCubit(InputFlat standart) : super(StandartCalculationLoading()) {
    getAnalogues(standart);
  }

  BargainRatio bargainRatio = BargainRatio(value: -0.045);
  ConditionAdjustments conditionAdjustments = ConditionAdjustments.creteStandart();
  Map<Parameter, Ratios> ratios = {
    Parameter.floor: Ratios.creteStandart(parameter: Parameter.floor),
    Parameter.flatArea: Ratios.creteStandart(parameter: Parameter.flatArea),
    Parameter.kitchenArea: Ratios.creteStandart(parameter: Parameter.kitchenArea),
    Parameter.hasBalcony: Ratios.creteStandart(parameter: Parameter.hasBalcony),
    Parameter.distanceFromMetro: Ratios.creteStandart(parameter: Parameter.distanceFromMetro),
  };

  getAnalogues(InputFlat flat) async {
    try {
      final resp = await StandartRequests.getAnalogues(flat);

      final Standart standart = Standart.fromResponseStandart(resp.standard);

      final List<Analogue> analogues = resp.analogs.map((e) => Analogue.fromResponseAnalogue(e)).toList();

      emit(StandartCalculationLoaded(analogues: analogues, standart: standart));
    } catch (e) {
      await LoginService.logout(message: 'Возникла проблема. Пожалуйста, перезайдите.');
    }
  }

  update() {
    if (state is StandartCalculationLoaded) {
      emit(StandartCalculationLoaded(
          analogues: (state as StandartCalculationLoaded).analogues,
          standart: (state as StandartCalculationLoaded).standart));
    }
  }
}
