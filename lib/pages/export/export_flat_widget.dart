import 'package:flutter/material.dart';
import 'package:mos_estate/pages/export/export_flat.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/utils/price_to_string.dart';
import 'package:mos_estate/shared/widget/flat_info_popup.dart';

class ExportFlatWidget extends StatelessWidget {
  const ExportFlatWidget({super.key, required this.flat, required this.id});

  final ExportFlat flat;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      decoration: const BoxDecoration(
        color: CustomColors.background,
        border: Border(
          top: BorderSide(color: CustomColors.div, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(width: 20),
                Text(
                  (id + 1).toString(),
                  style: const TextStyle(color: CustomColors.brightAccent, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Container(width: 20),
                SizedBox(
                  width: 100,
                  child: Text(
                    "${flat.flatArea}м²",
                    style: const TextStyle(color: CustomColors.brightAccent, fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                Container(width: 5),
                ExportFlatParameter(name: "Цена за метр", value: priceToString(flat.pricePerSqMeter)),
                Container(width: 5),
                ExportFlatParameter(name: "Цена", value: priceToString((flat.pricePerSqMeter * flat.flatArea).round())),
                Container(width: 20),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 77,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: CustomColors.backgroundAccent,
              child: Row(
                children: [
                  ExportFlatParameter(name: "Количество комнат", value: flat.roomsCount.toString()),
                  ExportFlatParameter(name: "Этаж", value: "${flat.flatFloor}/${flat.floorsInHouse}"),
                  ExportFlatParameter(name: "Состояние", value: flat.condition, flex: 2),
                  IconButton(
                      tooltip: "Посмотреть все параметры",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => FlatInfoPopup(
                            flat: flat,
                            name: "Квартира ${id + 1}",
                          ),
                        );
                      },
                      icon: const Icon(Icons.remove_red_eye, color: CustomColors.brightAccent, size: 30)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExportFlatParameter extends StatelessWidget {
  const ExportFlatParameter({super.key, required this.name, required this.value, this.flex});

  final String name;
  final String value;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(color: CustomColors.brightAccent, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          Text(
            name,
            style: const TextStyle(color: CustomColors.text, fontWeight: FontWeight.w500, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
