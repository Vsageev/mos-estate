import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  static Color get background => Colors.white;
  static Color get backgroundAccent => const Color.fromARGB(255, 230, 230, 230);
  static Color get textAccent => const Color.fromARGB(255, 159, 159, 159);
  static Color get text => Colors.black;
  static Color get textReverse => Colors.white;
  static Color get bright => Colors.pink;
  // const  Color get brightAccent = Color.fromARGB(255, 43, 82, 120);
  static Color get warn => const Color.fromARGB(255, 255, 46, 48);
  static Color get warnAccent => const Color.fromARGB(25, 255, 46, 48);
  static Color get buttonPressed => const Color.fromARGB(255, 23, 62, 100);
  static Color get navbar => const Color.fromARGB(255, 200, 200, 200);
  static Brightness get systemBrightness => Brightness.dark;
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
