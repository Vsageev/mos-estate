import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/widget/button.dart';
import 'package:mos_estate/shared/widget/submitable_text_form.dart';

class ImprotHeader extends StatelessWidget {
  const ImprotHeader({super.key, required this.flatSelected});

  final bool flatSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 77,
      child: Row(
        children: [
          Text(
            "Полученные данные:",
            style: TextStyle(color: CustomColors.text, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const Expanded(child: SizedBox.shrink()),
          SizedBox(
            width: 300,
            child: SubmitableTextForm(
              hint: "введите адрес...",
              textController: TextEditingController(),
              onSubmitted: BlocProvider.of<ImportCubit>(context).filter,
            ),
          ),
          if (flatSelected)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Button(
                padding: const EdgeInsets.all(8),
                onTap: BlocProvider.of<ImportCubit>(context).calculate,
                color: CustomColors.brightAccent,
                child: Text(
                  'Рассчитать',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: CustomColors.background),
                ),
              ),
            ),
        ],
      ),
    );
  }
}