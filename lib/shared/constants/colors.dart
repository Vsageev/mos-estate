import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomColors {
  static Color get text => Colors.black;
  static Color get background => Colors.white;
  static Color get backgroundAccent => const Color.fromARGB(255, 246, 247, 247);
  static Color get brightAccent => const Color.fromARGB(255, 61, 138, 204);
  static Color get darkAccent => const Color.fromARGB(255, 22, 60, 113);
  static Color get div => const Color.fromARGB(255, 207, 207, 207);
  static Color get buttonLight => const Color.fromARGB(255, 126, 181, 234);

  static Color get gradient1 => const Color.fromARGB(255, 71, 157, 235);
  static Color get gradient2 => const Color.fromARGB(255, 49, 115, 193);

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
