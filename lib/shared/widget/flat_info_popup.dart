import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/models/flat.dart';

class FlatInfoPopup extends StatelessWidget {
  const FlatInfoPopup({super.key, required this.flat, required this.name});

  final String name;
  final Flat flat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Column(
            children: [
              const Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 7,
                child: Center(
                  child: Container(
                    width: 600,
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      color: CustomColors.backgroundAccent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                          ),
                          Container(height: 30),
                          Text(
                            flat.position,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18, color: CustomColors.brightAccent),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Количество комнат: '),
                                TextSpan(
                                    text: flat.roomsCount.toString(),
                                    style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            flat.segment,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18, color: CustomColors.brightAccent),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Материал стен: '),
                                TextSpan(
                                    text: flat.wallsMaterial, style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Этаж: '),
                                TextSpan(
                                    text: '${flat.flatFloor}/${flat.floorsInHouse}',
                                    style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Площадь квартиры: '),
                                TextSpan(
                                    text: '${flat.flatArea}м²',
                                    style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Площадь кухни: '),
                                TextSpan(
                                    text: '${flat.kitchenArea}м²',
                                    style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Балкон/лоджа: '),
                                TextSpan(
                                    text: flat.hasBalcony.toString(),
                                    style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Удаленность от метро: '),
                                TextSpan(
                                    text: '${flat.distanceFromMetro} мин.',
                                    style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              children: <TextSpan>[
                                const TextSpan(text: 'Удаленность от метро: '),
                                TextSpan(
                                    text: flat.condition, style: const TextStyle(color: CustomColors.brightAccent)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
        ],
      ),
    );
  }
}
