import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/shared/models/input_flat.dart';
import 'package:mos_estate/pages/import/import_states.dart';

class ImportCubit extends Cubit<ImportState> {
  ImportCubit() : super(ImportWaiting());

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final bytes = result.files.first.bytes;
      var excel = Excel.decodeBytes(bytes!);

      final rows = excel.tables[excel.tables.keys.first]?.rows.sublist(2);

      final flats = rows?.map((e) => InputFlat.fromRow(e)).toList();

      emit(ImportLoaded(flats: flats ?? []));
    }
  }

  selectFlat(int id) {
    if (state is ImportLoaded) {
      emit(ImportLoaded(flats: (state as ImportLoaded).flats, selectedId: id));
    }
  }
}
