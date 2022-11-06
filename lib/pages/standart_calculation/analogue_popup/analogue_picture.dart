import 'package:flutter/material.dart';

class AnaloguePictue extends StatelessWidget {
  const AnaloguePictue({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 550,
      child: Image.network(
        url,
        isAntiAlias: true,
        fit: BoxFit.contain,
      ),
    );
  }
}
