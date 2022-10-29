import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/pages/import/import_states.dart';
import 'package:mos_estate/pages/import/import_widget.dart';
import 'package:mos_estate/pages/import/import_flat_widget.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/widget/navigated_page.dart';

class ImportPage extends StatelessWidget {
  const ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportCubit, ImportState>(
      builder: (context, state) {
        if (state is ImportLoaded) {
          return NavigatedPage(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [CustomColors.gradient2, CustomColors.gradient1],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 250,
                          child: ImportWidget(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColors.background,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Row(
                            children: [
                              ListView.separated(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: state.flats.length,
                                separatorBuilder: (context, index) => Container(height: 1, color: CustomColors.div),
                                itemBuilder: (context, index) => ImportFlatWidget(
                                  flat: state.flats[index],
                                  selected: state.selectedId == index,
                                ),
                              ),
                            ],
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

        return NavigatedPage(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [CustomColors.gradient2, CustomColors.gradient1],
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 250,
                    child: ImportWidget(),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColors.background,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.timelapse,
                          color: CustomColors.div,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
