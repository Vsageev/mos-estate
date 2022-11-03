import 'package:mos_estate/pages/import/input_flat.dart';

abstract class ImportState {}

class ImportWaiting extends ImportState {}

class ImportLoaded extends ImportState {
  List<InputFlat> flats;
  int? selectedId;
  ImportLoaded({required this.flats, this.selectedId});
}
