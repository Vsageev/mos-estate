import 'package:mos_estate/pages/import/input_flat.dart';

abstract class PoolState {}

class PoolUnselected extends PoolState {}

class PoolSelected extends PoolState {
  List<InputFlat> pool;
  InputFlat selected;
  PoolSelected({
    required this.pool,
    required this.selected,
  });
}
