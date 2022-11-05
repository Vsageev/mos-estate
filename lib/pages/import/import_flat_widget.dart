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
          Expanded(
            flex: 1,
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
                Expanded(
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.darkAccent, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        flat.position,
                        style: const TextStyle(color: CustomColors.text, fontWeight: FontWeight.w700, fontSize: 11),
                      ),
                    ),
                  ),
                ),
                Container(width: 20),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 77,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: CustomColors.backgroundAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImportFlatParameter(name: "Количество комнат", value: flat.roomsCount.toString()),
                  ImportFlatParameter(name: "Этаж", value: "${flat.flatFloor}/${flat.floorsInHouse}"),
                  ImportFlatParameter(name: "Материал стен", value: flat.wallsMaterial),
                  ImportFlatParameter(name: "Сегмент", value: flat.segment),
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
  const ImportFlatParameter({super.key, required this.name, required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(color: CustomColors.brightAccent, fontWeight: FontWeight.w700, fontSize: 24),
        ),
        Text(
          name,
          style: TextStyle(color: CustomColors.text, fontWeight: FontWeight.w500, fontSize: 12),
        ),
      ],
    );
  }
}
