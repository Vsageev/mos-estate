import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_states.dart';

class StandartCalculationCubit extends Cubit<StandartCalculationState> {
  StandartCalculationCubit() : super(StandartCalculationLoading());
}
