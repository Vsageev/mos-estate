import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class BargainTable extends StatelessWidget {
  const BargainTable({super.key, required this.ratio});

  final BargainRatio ratio;

  static const _side = BorderSide(
    color: CustomColors.brightAccent,
    width: 3,
  );

  String _getPercents(double ratio) {
    return "${(ratio * 100).toStringAsFixed(1)}%";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox.shrink()),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CustomColors.brightAccent, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(right: _side),
                  ),
                  width: 150,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: _side),
                        ),
                        height: 50,
                      ),
                      const SizedBox(
                        height: 70,
                        child: Center(
                          child: Text(
                            'Корректировка на торг',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: _side),
                        ),
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Значение',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Center(
                          child: Text(
                            _getPercents(ratio.value!),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
