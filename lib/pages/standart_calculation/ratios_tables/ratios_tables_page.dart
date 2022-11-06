import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/pages/standart_calculation/ratios_tables/bargain_table.dart';
import 'package:mos_estate/pages/standart_calculation/ratios_tables/condition_table.dart';
import 'package:mos_estate/pages/standart_calculation/ratios_tables/ratio_table.dart';
import 'package:mos_estate/shared/constants/parameters.dart';

class RatiosTablesPage extends StatelessWidget {
  const RatiosTablesPage(
      {super.key, required this.ratios, required this.bargainRatio, required this.conditionAdjustments});

  final Map<Parameter, Ratios> ratios;
  final BargainRatio bargainRatio;
  final ConditionAdjustments conditionAdjustments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: BargainTable(ratio: bargainRatio),
                ),
                ...ratios
                    .map(
                      (key, value) => MapEntry(
                        key,
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: RatioTable(
                            ratios: value,
                            title: key.getPresentational(),
                          ),
                        ),
                      ),
                    )
                    .values,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ConditionTable(adjustments: conditionAdjustments, title: "Состояние отделки"),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
