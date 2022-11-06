import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/export/export_cubit.dart';
import 'package:mos_estate/pages/export/export_flat_widget.dart';
import 'package:mos_estate/pages/export/export_states.dart';
import 'package:mos_estate/pages/export/export_widget.dart';
import 'package:mos_estate/pages/export/standart_export_flat_widget.dart';
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
            body: Stack(
              children: [
                Container(
                  height: 260,
                  width: 20000,
                  decoration: const BoxDecoration(color: CustomColors.importBackground),
                  child: Image.network(
                    'assets/decorations/import.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 260,
                        child: ExportWidget(),
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: CustomColors.background,
                          border: Border(
                            top: BorderSide(color: CustomColors.div, width: 1),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Эталон: ",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      StandartExportFlatWidget(
                        flat: state.standart,
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: CustomColors.background,
                          border: Border(
                            top: BorderSide(color: CustomColors.div, width: 1),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Остальной пул: ",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                            ),
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
                ),
              ],
            ),
          );
        }
        return Container();
      }),
    );
  }
}
