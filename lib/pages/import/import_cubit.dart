import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/pages/import/import_states.dart';

class ImportCubit extends Cubit<ImportState> {
  ImportCubit() : super(ImportWaiting());

  List<InputFlat>? lastFlats;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final bytes = result.files.first.bytes;
      var excel = Excel.decodeBytes(bytes!);

      final rows = excel.tables[excel.tables.keys.first]?.rows.sublist(2);

      lastFlats = rows?.map((e) => InputFlat.fromRow(e)).toList();

      emit(ImportLoaded(flats: lastFlats ?? []));
    }
  }

  filter(String location) {
    if (state is ImportLoaded) {
      emit(ImportLoaded(
          flats: lastFlats?.where((element) => element.position.contains(location)).toList() ?? [],
          selectedId: (state as ImportLoaded).selectedId));
    }
  }

  selectFlat(int id) {
    if (state is ImportLoaded) {
      emit(ImportLoaded(flats: (state as ImportLoaded).flats, selectedId: id));
    }
  }

  calculate() {}
}
