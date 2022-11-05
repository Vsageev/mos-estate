import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/export/export_cubit.dart';
import 'package:mos_estate/pages/export/export_flat_widget.dart';
import 'package:mos_estate/pages/export/export_states.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/widget/navigated_page.dart';

class ExportPage extends StatelessWidget {
  const ExportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportCubit, ExportState>(
      builder: ((context, state) {
        if (state is ExportLoaded) {
          return NavigatedPage(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 260,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [CustomColors.gradient2, CustomColors.gradient1],
                    ),
                  ),
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.flats.length,
                  itemBuilder: (context, index) {
                    return ExportFlatWidget(
                      flat: state.flats[index],
                      id: index,
                    );
                  },
                )
              ],
            ),
          ));
        }
        return Container();
      }),
    );
  }
}
