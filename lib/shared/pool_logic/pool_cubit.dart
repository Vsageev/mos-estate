import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/shared/pool_logic/pool_states.dart';

class PoolCubit extends Cubit<PoolState> {
  PoolCubit() : super(PoolUnselected());

  void submitPool(List<InputFlat> pool, int selectedId) {
    final selected = pool[selectedId];
    emit(PoolSelected(pool: pool..remove(selected), selected: selected));
  }
}
