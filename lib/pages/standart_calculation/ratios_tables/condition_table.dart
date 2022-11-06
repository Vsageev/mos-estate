import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/utils/price_to_string.dart';

class ConditionTable extends StatelessWidget {
  const ConditionTable({super.key, required this.adjustments, required this.title});

  final String title;
  final ConditionAdjustments adjustments;

  static const _side = BorderSide(
    color: CustomColors.brightAccent,
    width: 3,
  );

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
                    border: Border(
                      right: _side,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: const BoxDecoration(
                          border: Border(bottom: _side),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: adjustments.names.length * 50,
                            child: const RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                child: Text(
                                  'Объект оценки',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(67, 67, 67, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(left: _side),
                            ),
                            child: Column(
                              children: adjustments.names
                                  .map((e) => SizedBox(
                                        height: 50,
                                        width: 90,
                                        child: Center(
                                            child: Text(
                                          e,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: e.length < 8 ? 16 : 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        )),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: _side),
                        ),
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Объект аналог',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(67, 67, 67, 1),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          border: Border(bottom: _side),
                        ),
                        child: Row(
                          children: adjustments.names
                              .map(
                                (e) => Expanded(
                                  child: Center(
                                    child: Text(
                                      e,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: e.length < 8 ? 16 : 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      ...adjustments.values
                          .map(
                            (row) => SizedBox(
                              height: 50,
                              child: Row(
                                children: row
                                    .map(
                                      (e) => Expanded(
                                        child: Center(
                                          child: Text(
                                            priceToString(e),
                                            style: TextStyle(
                                              color: e == 0 ? const Color.fromRGBO(207, 207, 207, 1) : Colors.black,
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                          .toList()
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
