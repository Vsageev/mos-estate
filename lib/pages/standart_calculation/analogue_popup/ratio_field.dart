import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class RatioField extends StatefulWidget {
  RatioField({super.key, required this.hint, required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  State<RatioField> createState() => _RatioFieldState();
}

class _RatioFieldState extends State<RatioField> {
  final focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _onFinish();
      }
    });
    super.initState();
  }

  _onFinish() {
    if (widget.controller.text == "%") {
      widget.controller.text = "";
    } else {
      final value = double.tryParse(widget.controller.text.substring(0, widget.controller.text.length - 1));

      widget.controller.text = value != null ? value.toStringAsFixed(1) + "%" : "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.searchbar,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              maxLines: 1,
              controller: widget.controller,
              onChanged: (t) {
                if (t != " " && !t.endsWith('%')) {
                  final offset = widget.controller.selection;
                  widget.controller.text = t + "%";
                  widget.controller.selection = offset;
                }
              },
              onEditingComplete: () {
                _onFinish();
              },
              onSubmitted: (v) {
                _onFinish();
              },
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.-]')),
              ],
              style: const TextStyle(fontSize: 16, color: CustomColors.text, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
