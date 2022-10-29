import 'package:flutter/material.dart';
import 'package:mos_estate/pages/startup/startup_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const StartupPage(),
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
    ),
  );
}
