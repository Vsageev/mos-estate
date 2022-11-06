import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/condition_field.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/ratio_field.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class ConditionFeatureAdgustment extends StatelessWidget {
  const ConditionFeatureAdgustment({
    super.key,
    required this.featureName,
    required this.hint,
    required this.controller,
    required this.featureValue,
  });

  final String featureName;
  final String featureValue;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              children: <TextSpan>[
                TextSpan(text: featureName),
                TextSpan(text: featureValue, style: const TextStyle(color: CustomColors.brightAccent)),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: ConditionField(hint: hint, controller: controller),
          ),
        ],
      ),
    );
  }
}
