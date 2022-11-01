import 'package:mos_estate/pages/standart_calculation/analogue.dart';

abstract class StandartCalculationState {}

class StandartCalculationLoading extends StandartCalculationState {}

class StandartCalculationLoaded extends StandartCalculationState {
  List<Analogue> analogues;
  StandartCalculationLoaded({
    required this.analogues,
  });
}
