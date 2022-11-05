import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/main.dart';
import 'package:mos_estate/pages/login/login_response.dart';
import 'package:mos_estate/pages/login/login_state.dart';
import 'package:http/http.dart' as http;
import 'package:mos_estate/shared/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../import/import_cubit.dart';
import '../import/import_page.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  tryLogin(username,password) async {

    final token;

    Map data = {
      "username": username,
      "password": password
    };
    final response = await http.post(Uri.https('flasklct.herokuapp.com','/api/login'), body: json.encode(data),
     headers: {"Content-Type": "application/json"}
    );
    
    token = LoginResponse.fromJson(response.body).token;

    LoginService.instance.token = token;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);

    Navigator.push(navigatorKey.currentContext!, MaterialPageRoute(
          builder: (d) => BlocProvider(
            create: (context) => ImportCubit(),
            child: const ImportPage(),
          ),
        ),);
  }
}
