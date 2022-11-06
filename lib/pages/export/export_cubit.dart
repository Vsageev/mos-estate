import 'package:excel/excel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/main.dart';
import 'package:mos_estate/pages/export/export_flat.dart';
import 'package:mos_estate/pages/export/export_states.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/shared/constants/parameters.dart';
import 'package:mos_estate/shared/pool_logic/pool_cubit.dart';
import 'package:mos_estate/shared/pool_logic/pool_states.dart';
import 'package:mos_estate/shared/pool_logic/ratio_definer.dart';

class ExportCubit extends Cubit<ExportState> {
  ExportCubit(int standartPrice) : super(ExportLoading()) {
    _initFlats(standartPrice);
  }

  _initFlats(int standartPricePerSqMeter) {
    final standart = (BlocProvider.of<PoolCubit>(navigatorKey.currentContext!).state as PoolSelected).selected;
    final pool = (BlocProvider.of<PoolCubit>(navigatorKey.currentContext!).state as PoolSelected).pool;

    final standartExport = ExportFlat.fromImport(standart, standartPricePerSqMeter);

    final standartFloorRatio = RatioDefiner.floor(standartExport.flatFloor, standartExport.floorsInHouse);
    final standartFlatAreaRatio = RatioDefiner.flatArea(standartExport.flatArea);
    final standartKitchenAreaRatio = RatioDefiner.kitchenArea(standartExport.kitchenArea);
    final standartFlatBalconyRatio = RatioDefiner.balcony(standartExport.hasBalcony);
    final standartFlatMetroRatio = RatioDefiner.metro(standartExport.distanceFromMetro);
    final standartFlatConditionRatio = RatioDefiner.condition(standartExport.condition);

    ConditionAdjustments conditionAdjustments = ConditionAdjustments.creteStandart();
    Map<Parameter, Ratios> ratios = {
      Parameter.floor: Ratios.creteStandart(parameter: Parameter.floor),
      Parameter.flatArea: Ratios.creteStandart(parameter: Parameter.flatArea),
      Parameter.kitchenArea: Ratios.creteStandart(parameter: Parameter.kitchenArea),
      Parameter.hasBalcony: Ratios.creteStandart(parameter: Parameter.hasBalcony),
      Parameter.distanceFromMetro: Ratios.creteStandart(parameter: Parameter.distanceFromMetro),
    };

    final poolExport = pool.map((e) {
      double price = standartPricePerSqMeter *
          (1 + ratios[Parameter.floor]!.values[RatioDefiner.floor(e.flatFloor, e.floorsInHouse)][standartFloorRatio]) *
          (1 + ratios[Parameter.flatArea]!.values[RatioDefiner.flatArea(e.flatArea)][standartFlatAreaRatio]) *
          (1 +
              ratios[Parameter.kitchenArea]!.values[RatioDefiner.kitchenArea(e.kitchenArea)]
                  [standartKitchenAreaRatio]) *
          (1 + ratios[Parameter.hasBalcony]!.values[RatioDefiner.balcony(e.hasBalcony)][standartFlatBalconyRatio]) *
          (1 +
              ratios[Parameter.distanceFromMetro]!.values[RatioDefiner.metro(e.distanceFromMetro)]
                  [standartFlatMetroRatio]);
      price += conditionAdjustments.values[RatioDefiner.condition(e.condition)][standartFlatConditionRatio];

      return ExportFlat.fromImport(e, price.toInt());
    }).toList();

    emit(ExportLoaded(standart: standartExport, flats: poolExport));
  }

  save() {
    if (state is ExportLoaded) {
      var excel = Excel.createExcel();
      excel.appendRow('Sheet1', [
        'Местоположение',
        'Количество комнат',
        'Сегмент',
        'Этажность дома',
        'Материал стен',
        'Этаж расположения',
        'Площадь квартиры, кв.м',
        'Площадь кухни, кв.м',
        'Наличие балкона/лоджии',
        'Удаленность от станции метро, мин. пешком',
        'Состояние',
        'Цена за м²',
        'Цена',
      ]);

      excel.appendRow('Sheet1', (state as ExportLoaded).standart.toRow(isStandart: true));

      for (var flat in (state as ExportLoaded).flats) {
        excel.appendRow('Sheet1', flat.toRow());
      }

      excel.save(fileName: 'рассчет.xlsx');
    }
  }
}
