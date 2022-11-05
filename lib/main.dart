import 'package:flutter/material.dart';
import 'package:mos_estate/pages/startup/startup_page.dart';
import 'package:mos_estate/shared/services/login_service.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  LoginService.instance.token = prefs.getString('token');

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
