import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/main.dart';
import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/pages/import/import_states.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_cubit.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_page.dart';
import 'package:mos_estate/shared/pool_logic/pool_cubit.dart';

class ImportCubit extends Cubit<ImportState> {
  ImportCubit() : super(ImportWaiting());

  List<InputFlat>? lastFlats;

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      emit(ImportWaiting());

      final bytes = result.files.first.bytes;
      var excel = Excel.decodeBytes(bytes!);

      final rows = excel.tables[excel.tables.keys.first]?.rows.sublist(2);

      lastFlats = rows?.map((e) => InputFlat.fromRow(e)).toList();

      emit(ImportLoaded(flats: lastFlats ?? []));
    }
  }

  filter(String area) {
    if (state is ImportLoaded) {
      emit(ImportLoaded(
          flats: lastFlats?.where((element) => element.flatArea.toString().contains(area)).toList() ?? [],
          selectedId: (state as ImportLoaded).selectedId));
    }
  }

  selectFlat(int id) {
    if (state is ImportLoaded) {
      if (id == (state as ImportLoaded).selectedId) {
        emit(ImportLoaded(flats: (state as ImportLoaded).flats, selectedId: null));
      } else {
        emit(ImportLoaded(flats: (state as ImportLoaded).flats, selectedId: id));
      }
    }
  }

  calculate() {
    if (state is ImportLoaded) {
      if ((state as ImportLoaded).selectedId != null) {
        BlocProvider.of<PoolCubit>(navigatorKey.currentContext!)
            .submitPool((state as ImportLoaded).flats, (state as ImportLoaded).selectedId!);
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (d) => BlocProvider(
              create: (context) =>
                  StandartCalculationCubit((state as ImportLoaded).flats[(state as ImportLoaded).selectedId!]),
              child: const StandartCalculationPage(),
            ),
          ),
        );
      }
    }
  }
}
