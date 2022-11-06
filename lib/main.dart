import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/pages/import/import_page.dart';
import 'package:mos_estate/pages/login/login_cubit.dart';
import 'package:mos_estate/pages/login/login_page.dart';
import 'package:mos_estate/shared/pool_logic/pool_cubit.dart';
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
      child: BlocProvider(
        create: (c) => PoolCubit(),
        child: MaterialApp(
          title: 'Аналитический центр',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          home: _navigate(),
          theme: ThemeData(
            fontFamily: 'Montserrat',
          ),
        ),
      ),
    ),
  );
}

_navigate() {
  var token = LoginService.instance.token;
  if (token == null) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: LoginPage(),
    );
  } else {
    return BlocProvider(
      create: (context) => ImportCubit(),
      child: const ImportPage(),
    );
  }
}
