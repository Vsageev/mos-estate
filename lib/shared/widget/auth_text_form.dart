import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class AuthTextForm extends StatelessWidget {
  const AuthTextForm({Key? key, required this.hint})
      : super(key: key);

  final String hint;

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
              style: TextStyle(fontSize: 16, color: CustomColors.text, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 22.4, bottom: 18.4, top: 18.4),
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(130, 130, 130, 1),
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
