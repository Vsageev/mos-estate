import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/pages/standart_calculation/ratios_tables/ratio_table.dart';
import 'package:mos_estate/shared/constants/parameters.dart';

class RatiosTablesPage extends StatelessWidget {
  const RatiosTablesPage({super.key, required this.ratios});

  final Map<Parameter, Ratios> ratios;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ...ratios
                    .map(
                      (key, value) => MapEntry(
                        key,
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: RatioTable(
                            ratios: value,
                            title: key.getPresentational(),
                          ),
                        ),
                      ),
                    )
                    .values,
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
