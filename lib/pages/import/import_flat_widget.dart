import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/pages/import/input_flat.dart';
import 'package:mos_estate/shared/widget/custom_checkbox.dart';
import 'package:mos_estate/shared/widget/flat_info_popup.dart';

class ImportFlatWidget extends StatelessWidget {
  const ImportFlatWidget(
      {super.key, required this.flat, required this.selected, required this.onSelected, required this.id});

  final bool selected;
  final Function onSelected;
  final InputFlat flat;
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
          SizedBox(
            width: 220,
            child: Row(
              children: [
                Container(width: 20),
                Text(
                  (id + 1).toString(),
                  style: const TextStyle(color: CustomColors.brightAccent, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Container(width: 20),
                CustomCheckbox(
                  selected: selected,
                  onSelected: onSelected,
                ),
                Container(width: 20),
                Text(
                  "${flat.flatArea}м²",
                  style: const TextStyle(color: CustomColors.brightAccent, fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Container(width: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 77,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: CustomColors.backgroundAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImportFlatParameter(name: "Количество комнат", value: flat.roomsCount.toString()),
                  ImportFlatParameter(name: "Этаж", value: "${flat.flatFloor}/${flat.floorsInHouse}"),
                  ImportFlatParameter(name: "Наличие балкона/лоджии", value: flat.hasBalcony),
                  ImportFlatParameter(
                    name: "Состояние",
                    value: flat.condition,
                    flex: 2,
                  ),
                  IconButton(
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

class ImportFlatParameter extends StatelessWidget {
  const ImportFlatParameter({super.key, required this.name, required this.value, this.flex});

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
