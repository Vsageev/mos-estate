import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:overlay_support/overlay_support.dart';

showErrorNotification(String text) {
  showOverlayNotification(
    (context) {
      return Material(
        child: Container(
            padding: const EdgeInsets.all(17),
            color: CustomColors.darkAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                ),
              ],
            )),
      );
    },
    duration: const Duration(seconds: 1),
  );

  // ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(SnackBar(
  //   backgroundColor: CustomColors.backgroundAccent,
  //   content: Text(
  //     text,
  //     style: TextStyle(color: CustomColors.text),
  //   ),
  // ));
}
