import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/analogue_ratios_popup.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_cubit.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/widget/custom_checkbox.dart';

class AnalogueListAnalogue extends StatelessWidget {
  const AnalogueListAnalogue(
      {super.key,
      required this.analogue,
      required this.navigateToMarker,
      required this.id,
      required this.updateUI,
      required this.setMapEnabled});

  final int id;
  final Analogue analogue;
  final Function(LatLng) navigateToMarker;
  final Function updateUI;
  final Function setMapEnabled;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.help,
      child: GestureDetector(
        onTap: () {
          navigateToMarker(LatLng(analogue.coordinates.lat, analogue.coordinates.lng));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromRGBO(180, 220, 255, 1)))),
          child: Row(
            children: [
              Container(width: 10),
              Text(
                id.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                ),
              ),
              Container(width: 10),
              CustomCheckbox(
                selected: analogue.selected,
                onSelected: () {
                  analogue.selected = !analogue.selected;

                  updateUI();
                },
              ),
              Container(width: 10),
              Expanded(
                child: Text(
                  analogue.position,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(width: 10),
              Text(
                "${analogue.flatArea}м²",
                style: const TextStyle(
                  color: CustomColors.brightAccent,
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                ),
              ),
              IconButton(
                onPressed: () {
                  setMapEnabled(false);

                  showDialog(
                    context: context,
                    builder: (_) => AnalogueRatiosPopup(
                      analogue: analogue,
                      updateUI: updateUI,
                      id: id,
                      defaultRatios: BlocProvider.of<StandartCalculationCubit>(context).ratios,
                      defaultBargainRatio: BlocProvider.of<StandartCalculationCubit>(context).bargainRatio,
                      defaultConditionAdjustments: BlocProvider.of<StandartCalculationCubit>(context).conditionAdjustments,
                    ),
                  ).then((value) => setMapEnabled(true));
                },
                icon: const Icon(
                  Icons.edit,
                  color: CustomColors.darkAccent,
                  size: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
