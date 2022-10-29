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
          Expanded(
            child: Center(
              child: Text(
                'Импорт данных таблицы',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600, color: CustomColors.background),
              ),
            ),
          ),
          Container(width: 1.5, color: CustomColors.background, margin: const EdgeInsets.symmetric(vertical: 16)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Выбор файлов для импорта данных',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: CustomColors.background),
                        ),
                      ),
                      Container(width: 5),
                      DottedBorder(
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
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload,
                                  color: CustomColors.background,
                                ),
                                Container(width: 4),
                                Text(
                                  'Выбор файла',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600, color: CustomColors.background),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 41),
                  Button(
                    onTap: BlocProvider.of<ImportCubit>(context).pickFile,
                    color: CustomColors.buttonLight,
                    child: Center(
                      child: Text(
                        'Рассчитать',
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: CustomColors.background),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
