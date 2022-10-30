import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/models/input_flat.dart';
import 'package:mos_estate/shared/widget/checkbox.dart';

class ImportFlatWidget extends StatelessWidget {
  const ImportFlatWidget({super.key, required this.flat, required this.selected, required this.onSelected});

  final bool selected;
  final Function onSelected;
  final InputFlat flat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      decoration: BoxDecoration(
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
                CustomCheckbox(
                  selected: selected,
                  onSelected: onSelected,
                ),
                Container(width: 20),
                Text(
                  "${flat.flatArea}м²",
                  style: TextStyle(color: CustomColors.brightAccent, fontWeight: FontWeight.w700, fontSize: 20),
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
                        style: TextStyle(color: CustomColors.text, fontWeight: FontWeight.w700, fontSize: 11),
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
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: CustomColors.brightAccent, size: 30)),
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
