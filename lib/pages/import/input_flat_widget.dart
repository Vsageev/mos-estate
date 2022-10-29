import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_page.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/models/input_flat.dart';
import 'package:mos_estate/shared/widget/button.dart';

class InputFlatWidget extends StatelessWidget {
  const InputFlatWidget({super.key, required this.flat});

  final InputFlat flat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black)),
      height: 50,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(flat.position),
          Button(
            child: const Text('Рассчитать'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (d) => const StandartCalculationPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
