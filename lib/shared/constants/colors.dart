import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  static const Color text = Colors.black;
  static const Color background = Colors.white;
  static const Color backgroundAccent = Color.fromARGB(255, 246, 247, 247);
  static const Color brightAccent = Color.fromARGB(255, 61, 138, 204);
  static const Color darkAccent = Color.fromARGB(255, 22, 60, 113);
  static const Color buttonLight = Color.fromARGB(255, 126, 181, 234);

  static const Color div = Color.fromARGB(255, 207, 207, 207);
  static const Color searchbar = Color.fromARGB(255, 237, 237, 237);
  static const Color hint = Color.fromARGB(255, 90, 90, 90);

  static const Color importBackground = Color.fromARGB(255, 53, 123, 201);
  static const Color gradient1 = Color.fromARGB(255, 71, 157, 235);
  static const Color gradient2 = Color.fromARGB(255, 49, 115, 193);

  static const Color navbar = Color.fromARGB(255, 200, 200, 200);
  static const Brightness systemBrightness = Brightness.dark;
}

changeNavbarColor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: CustomColors.systemBrightness,
    statusBarBrightness: CustomColors.systemBrightness,
    statusBarIconBrightness: CustomColors.systemBrightness,
    systemNavigationBarColor: CustomColors.navbar,
  ));
}
