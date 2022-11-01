import 'package:flutter/material.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/pages/import/import_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/login/login_cubit.dart';
import 'package:mos_estate/pages/login/login_page.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_cubit.dart';
import 'package:mos_estate/pages/standart_calculation/standart_calculation_page.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  _navigate(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (d) => BlocProvider(
    //       create: (context) => ImportCubit(),
    //       child: const ImportPage(),
    //     ),
    //   ),
    // );
    //  Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (d) => BlocProvider(
    //       create: (context) => LoginCubit(),
    //       child: LoginPage(),
    //     ),
    //   ),
    // );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (d) => BlocProvider(
          create: (context) => StandartCalculationCubit(),
          child: const StandartCalculationPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate(context);
    });

    return Container();
  }
}
