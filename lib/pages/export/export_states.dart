import 'package:mos_estate/pages/export/export_flat.dart';

abstract class ExportState {}

class ExportLoading extends ExportState {}

class ExportLoaded extends ExportState {
  ExportFlat standart;
  List<ExportFlat> flats;
  ExportLoaded({
    required this.standart,
    required this.flats,
  });
}
