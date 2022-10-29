import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StandartCalculationPage extends StatelessWidget {
  const StandartCalculationPage({super.key});

  // late GoogleMapController mapController;

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(45.521563, -122.677433),
          zoom: 11.0,
        ),
      ),
    );
  }
}
