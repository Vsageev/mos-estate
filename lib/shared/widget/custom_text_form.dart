import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({Key? key, required this.hint, required this.controller, this.hidden = false}) : super(key: key);

  final bool hidden;
  final String hint;
  final TextEditingController controller;

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
              obscureText: hidden,
              maxLines: 1,
              controller: controller,
              style: TextStyle(fontSize: 16, color: CustomColors.text, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 22.4, bottom: 18.4, top: 18.4),
                hintText: hint,
                hintStyle: TextStyle(
                  color: CustomColors.hint,
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
