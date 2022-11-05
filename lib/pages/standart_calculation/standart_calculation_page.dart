import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mos_estate/pages/export/export_cubit.dart';
import 'package:mos_estate/pages/export/export_page.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_list.dart';
import 'package:mos_estate/pages/standart_calculation/marker_drawers.dart';
import 'package:mos_estate/pages/standart_calculation/ratios_tables/ratios_tables_page.dart';
import 'package:mos_estate/pages/standart_calculation/standart.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_cubit.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_states.dart';
import 'package:mos_estate/pages/standart_calculation/standart_panel.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/constants/parameters.dart';
import 'package:mos_estate/shared/utils/get_random_string.dart';
import 'package:mos_estate/shared/widget/button.dart';
import 'package:mos_estate/shared/widget/flat_info_popup.dart';
import 'package:mos_estate/shared/widget/navigated_page.dart';

class StandartCalculationPage extends StatefulWidget {
  const StandartCalculationPage({super.key});

  @override
  State<StandartCalculationPage> createState() => _StandartCalculationPageState();
}

class _StandartCalculationPageState extends State<StandartCalculationPage> {
  Set<Marker> _markers = {};
  late GoogleMapController mapController;
  bool mapActive = true;

  _initMarkers(List<Analogue> analogues) async {
    Set<Marker> tempMarkers = {};

    for (var e in analogues) {
      tempMarkers.add(Marker(
        icon: await (() async {
          Uint8List markerIcon = await drawAnalogue(1, 30, 30, e.selected);
          return BitmapDescriptor.fromBytes(markerIcon);
        }()),
        position: LatLng(e.coordinates.lat, e.coordinates.lng),
        markerId: MarkerId(
          getRandomString(5),
        ),
      ));
    }

    tempMarkers.add(Marker(
      icon: await (() async {
        Uint8List markerIcon = await drawStandart(30, 30);
        return BitmapDescriptor.fromBytes(markerIcon);
      }()),
      position: const LatLng(55.7707139, 37.6406965),
      markerId: MarkerId(
        getRandomString(5),
      ),
    ));

    setState(() {
      _markers = tempMarkers;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _setMapGestureDetection(bool enabled) {
    setState(() {
      mapActive = enabled;
    });
  }

  int _getPrice(List<Analogue> analogues, Standart standart) {
    int i = 0;
    double sum = 0;
    double tempPrice;

    final bargainRatio = BlocProvider.of<StandartCalculationCubit>(context).bargainRatio;
    final ratios = BlocProvider.of<StandartCalculationCubit>(context).ratios;

    for (var e in analogues) {
      if (e.selected) {
        tempPrice = e.price.toDouble();
        for (var p in Parameter.values) {
          tempPrice *=
              (1 + (e.ratios[p] ?? ratios[p]!.values[e.ratiosCoordinates[p]!.row][e.ratiosCoordinates[p]!.column]));
        }
        tempPrice *= 1 + (e.bargainRatio.value ?? bargainRatio.value!);
        ++i;
        sum += tempPrice / e.flatArea;
      }
    }

    return i != 0 ? sum ~/ i : 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandartCalculationCubit, StandartCalculationState>(builder: (context, state) {
      if (state is StandartCalculationLoaded) {
        return NavigatedPage(
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                          clipBehavior: Clip.antiAlias,
                          child: GoogleMap(
                            onMapCreated: (c) {
                              _onMapCreated(c);
                              _initMarkers(state.analogues);
                            },
                            zoomGesturesEnabled: mapActive,
                            markers: _markers,
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(55.7607139, 37.6006965),
                              zoom: 11.0,
                            ),
                          ),
                        ),
                      ),
                      Container(height: 24),
                      StandartPanel(
                        price: (_getPrice(state.analogues, state.standart) * state.standart.flatArea).round(),
                        setMapEnabled: _setMapGestureDetection,
                        standart: state.standart,
                      )
                    ],
                  ),
                ),
                Container(width: 30),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Button(
                        border: Border.all(color: CustomColors.brightAccent, width: 2),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.calendar_view_month,
                              color: CustomColors.brightAccent,
                              size: 21,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Таблица поправок',
                              style: TextStyle(
                                color: CustomColors.brightAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (d) => RatiosTablesPage(
                                ratios: BlocProvider.of<StandartCalculationCubit>(context).ratios,
                              ),
                            ),
                          );
                        },
                      ),
                      AnalogueList(
                        setMapEnabled: _setMapGestureDetection,
                        updateUI: () {
                          setState(() {});
                          _initMarkers(state.analogues);
                        },
                        analogues: state.analogues,
                        navigateToMarker: (d) {
                          mapController.animateCamera(CameraUpdate.newLatLng(d));
                        },
                      ),
                      Button(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Расчитать пул',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (d) => BlocProvider(
                                create: (context) => ExportCubit(_getPrice(state.analogues, state.standart)),
                                child: const ExportPage(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }

      return Container();
    });
  }
}
