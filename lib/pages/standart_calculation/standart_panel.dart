import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/standart.dart';
import 'package:mos_estate/shared/utils/price_to_string.dart';
import 'package:mos_estate/shared/widget/button.dart';
import 'package:mos_estate/shared/widget/flat_info_popup.dart';

class StandartPanel extends StatelessWidget {
  const StandartPanel({super.key, required this.price, required this.setMapEnabled, required this.standart});

  final Standart standart;
  final int price;
  final Function setMapEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 53, 124, 202),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Text(
            'Цена эталона:',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          Text(
            "   " + priceToString(price),
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
          ),
          const Expanded(child: SizedBox.shrink()),
          Button(
            color: Colors.transparent,
            child: Row(
              children: [
                const Icon(
                  Icons.visibility,
                  color: Colors.white,
                  size: 16,
                ),
                Container(width: 10),
                const Text(
                  'Посмотреть эталон',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            onTap: () {
              setMapEnabled(false);

              showDialog(
                context: context,
                builder: (_) => FlatInfoPopup(
                  flat: standart,
                  name: "Эталон",
                ),
              ).then((value) => setMapEnabled(true));
            },
          ),
        ],
      ),
    );
  }
}
