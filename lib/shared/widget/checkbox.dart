import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.selected, required this.onSelected});

  final bool selected;
  final Function onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected();
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.darkAccent, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: selected
            ? Center(
                child: Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(color: CustomColors.darkAccent, borderRadius: BorderRadius.circular(2)),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
