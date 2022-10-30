import 'package:flutter/material.dart';
import 'package:mos_estate/shared/constants/colors.dart';

class SubmitableTextForm extends StatelessWidget {
  const SubmitableTextForm({Key? key, required this.textController, required this.onSubmitted, this.hint})
      : super(key: key);

  final TextEditingController textController;
  final Function(String) onSubmitted;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: CustomColors.searchbar,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: onSubmitted,
              maxLines: 1,
              controller: textController,
              style: TextStyle(fontSize: 12, color: CustomColors.text, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(8),
                hintText: hint,
                hintStyle: TextStyle(
                  color: CustomColors.hint,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onSubmitted(textController.text);
            },
            icon: Icon(
              Icons.search,
              color: CustomColors.text,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
