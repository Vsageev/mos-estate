import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_list_analogue.dart';

class AnalogueList extends StatelessWidget {
  const AnalogueList({super.key, required this.analogues, required this.navigateToMarker});

  final List<Analogue> analogues;
  final Function(LatLng) navigateToMarker;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(240, 248, 255, 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(19),
              child: Text(
                'Аналоги',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: analogues.length,
                itemBuilder: (context, i) {
                  return AnalogueListAnalogue(
                    id: i + 1,
                    analogue: analogues[i],
                    navigateToMarker: navigateToMarker,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
