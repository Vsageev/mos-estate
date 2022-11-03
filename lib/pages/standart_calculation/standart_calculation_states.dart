import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/standart.dart';

abstract class StandartCalculationState {}

class StandartCalculationLoading extends StandartCalculationState {}

class StandartCalculationLoaded extends StandartCalculationState {
  List<Analogue> analogues;
  Standart standart;
  StandartCalculationLoaded({
    required this.analogues,
    required this.standart,
  });
}
