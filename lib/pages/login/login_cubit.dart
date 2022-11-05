import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/main.dart';
import 'package:mos_estate/pages/login/login_state.dart';
import 'package:http/http.dart' as http;
import 'package:mos_estate/requests/login_requests.dart';
import 'package:mos_estate/shared/services/login_service.dart';
import 'package:mos_estate/shared/widget/show_error_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../import/import_cubit.dart';
import '../import/import_page.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  tryLogin(String username, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final response = await LoginRequests.login(username, password);

      if (response.token != null) {
        LoginService.instance.token = response.token;

        await prefs.setString('token', response.token!);

        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (d) => BlocProvider(
              create: (context) => ImportCubit(),
              child: const ImportPage(),
            ),
          ),
        );
      } else {
        showErrorNotification('Не удалось войти');
      }
    } catch (e) {
      showErrorNotification('Не удалось войти');
      print(e);
    }
  }
}
