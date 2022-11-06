import 'package:flutter/material.dart';
import 'package:mos_estate/main.dart';
import 'package:mos_estate/pages/startup/startup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  String? token;

  LoginService._privateConstructor(this.token);

  static final LoginService _instance = LoginService._privateConstructor(null);

  static LoginService get instance => _instance;

  static logout() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.clear();
    _instance.token = null;

    Navigator.popUntil(navigatorKey.currentContext!, (route) => false);

    await Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (d) => const StartupPage()),
    );
  }
}
