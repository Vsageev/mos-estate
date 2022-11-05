import 'package:mos_estate/shared/constants/parameters.dart';

class Ratios {
  final List<String> names;
  final List<List<double>> values;
  Ratios({
    required this.names,
    required this.values,
  });

  factory Ratios.creteStandart({required Parameter parameter}) {
    switch (parameter) {
      case Parameter.floor:
        return Ratios(
          names: ['Первый этаж', 'Средние этажи', 'Последний этаж'],
          values: [
            [0, -0.07, -0.031],
            [0.075, 0, 0.042],
            [0.032, -0.04, 0],
          ],
        );
      case Parameter.flatArea:
        return Ratios(
          names: ['<30', '30-50', '50-65', '65-90', '90-120', '>120'],
          values: [
            [0, 0.06, 0.14, 0.21, 0.28, 0.31],
            [-0.06, 0, 0.07, 0.14, 0.21, 0.24],
            [-0.12, -0.07, 0, 0.06, 0.13, 0.16],
            [-0.17, -0.12, -0.06, 0, 0.06, 0.09],
            [-0.22, -0.17, -0.11, -0.06, 0, 0.03],
            [-0.24, -0.19, -0.13, -0.08, -0.03, 0],
          ],
        );
      case Parameter.kitchenArea:
        return Ratios(
          names: ['до 7', '7-10', '10-15'],
          values: [
            [0, -0.029, -0.083],
            [0.03, 0, -0.055],
            [0.09, 0.058, 0],
          ],
        );
      case Parameter.hasBalcony:
        return Ratios(
          names: ['Нет', 'Да'],
          values: [
            [0, -0.05],
            [0.053, 0],
          ],
        );
      case Parameter.distanceFromMetro:
        return Ratios(
          names: ['до 5', '5-10', '10-15', '15-30', '30-60', '60-90'],
          values: [
            [0, 0.07, 0.12, 0.17, 0.24, 0.29],
            [-0.07, 0, 0.04, 0.09, 0.15, 0.20],
            [-0.11, -0.04, 0, 0.05, 0.11, 0.15],
            [-0.15, -0.08, -0.05, 0, 0.06, 0.10],
            [-0.19, -0.13, -0.10, -0.06, 0, 0.04],
            [-0.22, -0.17, -0.13, -0.09, -0.04, 0],
          ],
        );
      case Parameter.condition:
        return Ratios(
          names: ['Без отделки', 'Муниципальный ремонт', 'Современная отделка'],
          values: [
            [0, -0.07, -0.031],
            [0.075, 0, 0.042],
            [0.032, -0.04, 0],
          ],
        );
      default:
        return Ratios(names: [], values: [[], []]);
    }
  }
}
