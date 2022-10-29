import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class Button extends StatefulWidget {
  Button({
    Key? key,
    required this.child,
    required this.onTap,
    this.color,
    this.tapColor,
    this.width,
    this.borderRadius,
    this.padding,
    this.margin,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final Color? tapColor;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function() onTap;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color get _getColor => widget.color ?? CustomColors.brightAccent;
  bool isTaped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: widget.padding ?? const EdgeInsets.all(15),
        margin: widget.margin,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
          color: !isTaped
              ? _getColor
              : HSLColor.fromColor(_getColor).withLightness(HSLColor.fromColor(_getColor).lightness * 0.8).toColor(),
        ),
        child: widget.child,
      ),
      onTapDown: (details) {
        setState(() {
          isTaped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTaped = false;
        });
      },
      onTap: () {
        widget.onTap();
        setState(() {
          isTaped = false;
        });
      },
    );
  }
}
