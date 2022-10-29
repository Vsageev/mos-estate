import 'package:mos_estate/shared/models/input_flat.dart';

abstract class ImportState {}

class ImportWaiting extends ImportState {}

class ImportLoaded extends ImportState {
  List<InputFlat> flats;
  int? selectedId;
  ImportLoaded({required this.flats, this.selectedId});
}
