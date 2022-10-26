import 'package:flutter/material.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/pages/import/import_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  _navigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (d) => BlocProvider(
          create: (context) => ImportCubit(),
          child: const ImportPage(),
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
