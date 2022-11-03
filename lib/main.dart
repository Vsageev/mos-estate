import 'package:flutter/material.dart';
import 'package:mos_estate/pages/startup/startup_page.dart';
import 'package:overlay_support/overlay_support.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: const StartupPage(),
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
      ),
    ),
  );
}
