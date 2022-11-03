import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';

Future<Uint8List> drawAnalogue(int customNum, int width, int height, bool selected) async {
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = selected ? CustomColors.brightAccent : Colors.grey[200]!;
  final Radius radius = Radius.circular(width / 2);

  canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
      paint);

  TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
  painter.text = TextSpan(
    text: customNum.toString(), // your custom number here
    style: TextStyle(fontSize: 20.0, color: selected ? Colors.white : Colors.black),
  );

  painter.layout();
  painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * .5) - painter.height * 0.5));
  final img = await pictureRecorder.endRecording().toImage(width, height);
  final data = await img.toByteData(format: ImageByteFormat.png);
  return data!.buffer.asUint8List();
}

Future<Uint8List> drawStandart(int width, int height) async {
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = CustomColors.brightAccent;
  final Radius radius = Radius.circular(width / 2);

  canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
      paint);

  TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
  painter.text = const TextSpan(
    text: '*',
    style: TextStyle(fontSize: 20.0, color: Colors.white),
  );

  painter.layout();
  painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * .5) - painter.height * 0.5));
  final img = await pictureRecorder.endRecording().toImage(width, height);
  final data = await img.toByteData(format: ImageByteFormat.png);
  return data!.buffer.asUint8List();
}
