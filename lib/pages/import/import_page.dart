import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/pages/import/import_header.dart';
import 'package:mos_estate/pages/import/import_states.dart';
import 'package:mos_estate/pages/import/import_widget.dart';
import 'package:mos_estate/pages/import/import_flat_widget.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/widget/navigated_page.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
                  height: 260,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [CustomColors.gradient2, CustomColors.gradient1],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 250,
                          child: ImportWidget(),
                        ),
                      ),
                      SliverPinnedHeader(
                        child: ImprotHeader(
                          flatSelected: state.selectedId != null,
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => ImportFlatWidget(
                            flat: state.flats[index],
                            selected: state.selectedId == index,
                            onSelected: () => BlocProvider.of<ImportCubit>(context).selectFlat(index),
                          ),
                          childCount: state.flats.length,
                        ),
                      ),
                    ],
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
