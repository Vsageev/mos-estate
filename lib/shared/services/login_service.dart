import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/main.dart';
import 'package:mos_estate/pages/login/login_cubit.dart';
import 'package:mos_estate/pages/login/login_page.dart';
import 'package:mos_estate/shared/widget/show_error_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  String? token;

  LoginService._privateConstructor(this.token);

  static final LoginService _instance = LoginService._privateConstructor(null);

  static LoginService get instance => _instance;

  static logout({String? message}) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.clear();
    _instance.token = null;

    Navigator.popUntil(navigatorKey.currentContext!, (route) => false);

    await Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (d) => BlocProvider(
          create: (context) => LoginCubit(),
          child: LoginPage(),
        ),
      ),
    );

    if (message != null) {
      showErrorNotification('Возникла проблема. Пожалуйста, перезайдите.');
    }
  }
}
