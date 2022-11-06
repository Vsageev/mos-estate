import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/export/export_cubit.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/widget/button.dart';

class ExportWidget extends StatelessWidget {
  const ExportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Экспорт пула',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600, color: CustomColors.background),
              ),
            ),
          ),
          Container(width: 1.5, color: CustomColors.background, margin: const EdgeInsets.symmetric(vertical: 16)),
          Expanded(
            child: Center(
              child: Button(
                width: 200,
                onTap: BlocProvider.of<ExportCubit>(context).save,
                color: Colors.white,
                child: SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.download,
                      ),
                      Container(width: 4),
                      const Text(
                        'Сохранить',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
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
