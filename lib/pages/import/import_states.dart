import 'package:mos_estate/shared/models/input_flat.dart';

abstract class ImportState {}

class ImportWaiting extends ImportState {}

class ImportLoaded extends ImportState {
  List<InputFlat> flats;
  ImportLoaded({
    required this.flats,
  });
}
