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

    Map<Parameter, Ratios> ratios = {
      Parameter.floor: Ratios.creteStandart(parameter: Parameter.floor),
      Parameter.flatArea: Ratios.creteStandart(parameter: Parameter.flatArea),
      Parameter.kitchenArea: Ratios.creteStandart(parameter: Parameter.kitchenArea),
      Parameter.hasBalcony: Ratios.creteStandart(parameter: Parameter.hasBalcony),
      Parameter.distanceFromMetro: Ratios.creteStandart(parameter: Parameter.distanceFromMetro),
      Parameter.condition: Ratios.creteStandart(parameter: Parameter.condition),
    };

    final poolExport = pool.map((e) {
      final price = standartPricePerSqMeter *
          (1 + ratios[Parameter.floor]!.values[standartFloorRatio][RatioDefiner.floor(e.flatFloor, e.floorsInHouse)]) *
          (1 + ratios[Parameter.flatArea]!.values[standartFlatAreaRatio][RatioDefiner.flatArea(e.flatArea)]) *
          (1 +
              ratios[Parameter.kitchenArea]!.values[standartKitchenAreaRatio]
                  [RatioDefiner.kitchenArea(e.kitchenArea)]) *
          (1 + ratios[Parameter.hasBalcony]!.values[standartFlatBalconyRatio][RatioDefiner.balcony(e.hasBalcony)]) *
          (1 +
              ratios[Parameter.distanceFromMetro]!.values[standartFlatMetroRatio]
                  [RatioDefiner.metro(e.distanceFromMetro)]) *
          (1 + ratios[Parameter.condition]!.values[standartFlatConditionRatio][RatioDefiner.condition(e.condition)]);

      return ExportFlat.fromImport(e, price.toInt());
    }).toList();

    emit(ExportLoaded(standart: standartExport, flats: poolExport));
  }
}
