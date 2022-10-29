import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class NavigatedPage extends StatelessWidget {
  final Widget body;

  const NavigatedPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              Container(
                height: 55,
              ),
              Expanded(
                child: body,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: CustomColors.div, width: 1),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    color: CustomColors.brightAccent,
                  ),
                  Container(width: 16),
                  const Text(
                    'Аналитический центр Москвы',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
