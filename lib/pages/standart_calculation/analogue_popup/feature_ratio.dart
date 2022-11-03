import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/ratio_field.dart';

class FeatureRatio extends StatelessWidget {
  const FeatureRatio({super.key, required this.featureName, required this.hint, required this.controller});

  final String featureName;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            featureName,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          SizedBox(
            width: 150,
            child: RatioField(hint: hint, controller: controller),
          ),
        ],
      ),
    );
  }
}
