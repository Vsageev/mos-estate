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
                  width: 20000,
                  decoration: const BoxDecoration(color: CustomColors.importBackground),
                  child: Image.network(
                    'assets/decorations/import.png',
                    fit: BoxFit.cover,
                  ),
                ),
                CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 250,
                        child: ImportWidget(),
                      ),
                    ),
                    SliverPinnedHeader(
                      child: ImportHeader(
                        flatSelected: state.selectedId != null,
                      ),
                    ),
                    if (state.flats.isEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Text(
                              "Таких квартир не нашлось",
                              style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ImportFlatWidget(
                          flat: state.flats[index],
                          selected: state.selectedId == index,
                          onSelected: () => BlocProvider.of<ImportCubit>(context).selectFlat(index),
                          id: index,
                        ),
                        childCount: state.flats.length,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

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
              Column(
                children: [
                  const SizedBox(
                    height: 250,
                    child: ImportWidget(),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: CustomColors.background,
                      ),
                      child: Center(
                        child: Text(
                          "Импортируйте данные",
                          style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w700, fontSize: 30),
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
