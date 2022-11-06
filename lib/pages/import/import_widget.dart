import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/widget/button.dart';

class ImportWidget extends StatelessWidget {
  const ImportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Импорт пула',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600, color: CustomColors.background),
              ),
            ),
          ),
          Container(width: 1.5, color: CustomColors.background, margin: const EdgeInsets.symmetric(vertical: 16)),
          Expanded(
            child: Center(
              child: DottedBorder(
                dashPattern: const [10, 10],
                borderType: BorderType.RRect,
                strokeWidth: 2,
                radius: const Radius.circular(4),
                color: CustomColors.background,
                padding: const EdgeInsets.all(0),
                strokeCap: StrokeCap.round,
                child: Button(
                  width: 200,
                  onTap: BlocProvider.of<ImportCubit>(context).pickFile,
                  color: Colors.transparent,
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.upload,
                          color: CustomColors.background,
                        ),
                        Container(width: 4),
                        const Text(
                          'Выбор файла',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColors.background),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
