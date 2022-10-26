import 'package:flutter/material.dart';
import 'package:mos_estate/pages/import/import_page.dart';
import 'package:mos_estate/pages/startup/startup_page.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: StartupPage(),
    ),
  );
}
