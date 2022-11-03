import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class RatioField extends StatelessWidget {
  const RatioField({super.key, required this.hint, required this.controller});

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
              maxLines: 1,
              controller: controller,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.-]')),
              ],
              style: TextStyle(fontSize: 16, color: CustomColors.text, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: hint,
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
