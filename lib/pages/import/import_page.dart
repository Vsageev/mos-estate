import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mos_estate/pages/import/import_cubit.dart';
import 'package:mos_estate/pages/import/import_states.dart';
import 'package:mos_estate/pages/import/input_flat_widget.dart';

class ImportPage extends StatelessWidget {
  const ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportCubit, ImportState>(
      builder: (context, state) {
        if (state is ImportLoaded) {
          return Scaffold(
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 80,
              ),
              itemCount: state.flats.length,
              itemBuilder: (context, index) => InputFlatWidget(flat: state.flats[index]),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: BlocProvider.of<ImportCubit>(context).pickFile,
              child: const Text('Import'),
            ),
          ),
        );
      },
    );
  }
}
