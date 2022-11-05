import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/feature_ratio.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/constants/parameters.dart';
import 'package:mos_estate/shared/widget/button.dart';
import 'package:mos_estate/shared/widget/show_error_notification.dart';

class AnalogueRatiosPopup extends StatefulWidget {
  AnalogueRatiosPopup(
      {super.key,
      required this.analogue,
      required this.updateUI,
      required this.id,
      required this.defaultBargainRatio,
      required this.defaultRatios}) {
    hintFloor = defaultRatios[Parameter.floor]!
        .values[analogue.ratiosCoordinates[Parameter.floor]!.row][analogue.ratiosCoordinates[Parameter.floor]!.column]
        .toString();
    hintFlatArea = defaultRatios[Parameter.flatArea]!
        .values[analogue.ratiosCoordinates[Parameter.flatArea]!.row]
            [analogue.ratiosCoordinates[Parameter.flatArea]!.column]
        .toString();
    hintKitchenArea = defaultRatios[Parameter.kitchenArea]!
        .values[analogue.ratiosCoordinates[Parameter.kitchenArea]!.row]
            [analogue.ratiosCoordinates[Parameter.kitchenArea]!.column]
        .toString();
    hintBalcony = defaultRatios[Parameter.hasBalcony]!
        .values[analogue.ratiosCoordinates[Parameter.hasBalcony]!.row]
            [analogue.ratiosCoordinates[Parameter.hasBalcony]!.column]
        .toString();
    hintMetro = defaultRatios[Parameter.distanceFromMetro]!
        .values[analogue.ratiosCoordinates[Parameter.distanceFromMetro]!.row]
            [analogue.ratiosCoordinates[Parameter.distanceFromMetro]!.column]
        .toString();
    hintCondition = defaultRatios[Parameter.condition]!
        .values[analogue.ratiosCoordinates[Parameter.condition]!.row]
            [analogue.ratiosCoordinates[Parameter.condition]!.column]
        .toString();
    hintBargain = defaultBargainRatio.value.toString();

    initFloor = (analogue.ratios[Parameter.floor] ?? "").toString();
    initFlatArea = (analogue.ratios[Parameter.flatArea] ?? "").toString();
    initKitchenArea = (analogue.ratios[Parameter.kitchenArea] ?? "").toString();
    initBalcony = (analogue.ratios[Parameter.hasBalcony] ?? "").toString();
    initMetro = (analogue.ratios[Parameter.distanceFromMetro] ?? "").toString();
    initCondition = (analogue.ratios[Parameter.condition] ?? "").toString();
    initBargain = (analogue.bargainRatio.value ?? "").toString();
  }

  final Analogue analogue;
  final Function updateUI;
  final int id;

  final BargainRatio defaultBargainRatio;
  final Map<Parameter, Ratios> defaultRatios;

  var hintFloor = "";
  var hintFlatArea = "";
  var hintKitchenArea = "";
  var hintBalcony = "";
  var hintMetro = "";
  var hintCondition = "";
  var hintBargain = "";

  var initFloor = "";
  var initFlatArea = "";
  var initKitchenArea = "";
  var initBalcony = "";
  var initMetro = "";
  var initCondition = "";
  var initBargain = "";

  @override
  State<AnalogueRatiosPopup> createState() => _AnalogueRatiosPopupState();
}

class _AnalogueRatiosPopupState extends State<AnalogueRatiosPopup> {
  final TextEditingController floorRatio = TextEditingController();
  final TextEditingController flatAreaRatio = TextEditingController();
  final TextEditingController kitchenAreaRatio = TextEditingController();
  final TextEditingController balconyRatio = TextEditingController();
  final TextEditingController metroDistanceRatio = TextEditingController();
  final TextEditingController conditionRatio = TextEditingController();
  final TextEditingController bargainRatio = TextEditingController();

  @override
  void initState() {
    super.initState();

    floorRatio.text = widget.initFloor;
    flatAreaRatio.text = widget.initFlatArea;
    kitchenAreaRatio.text = widget.initKitchenArea;
    balconyRatio.text = widget.initBalcony;
    metroDistanceRatio.text = widget.initMetro;
    conditionRatio.text = widget.initCondition;
    bargainRatio.text = widget.initBargain;

    floorRatio.addListener(() => setState(() {}));
    flatAreaRatio.addListener(() => setState(() {}));
    kitchenAreaRatio.addListener(() => setState(() {}));
    balconyRatio.addListener(() => setState(() {}));
    metroDistanceRatio.addListener(() => setState(() {}));
    conditionRatio.addListener(() => setState(() {}));
    bargainRatio.addListener(() => setState(() {}));
  }

  _onSubmit() {
    if (_hasErrors()) {
      return;
    }

    widget.analogue.ratios[Parameter.floor] = double.tryParse(floorRatio.text);
    widget.analogue.ratios[Parameter.flatArea] = double.tryParse(flatAreaRatio.text);
    widget.analogue.ratios[Parameter.kitchenArea] = double.tryParse(kitchenAreaRatio.text);
    widget.analogue.ratios[Parameter.hasBalcony] = double.tryParse(balconyRatio.text);
    widget.analogue.ratios[Parameter.distanceFromMetro] = double.tryParse(metroDistanceRatio.text);
    widget.analogue.ratios[Parameter.condition] = double.tryParse(conditionRatio.text);
    widget.analogue.bargainRatio.value = double.tryParse(bargainRatio.text);

    Navigator.pop(context);
  }

  bool _hasErrors() {
    if (floorRatio.text.isNotEmpty && double.tryParse(floorRatio.text) == null) {
      showErrorNotification('Неверно введена поправка для этажа');
      return true;
    }
    if (flatAreaRatio.text.isNotEmpty && double.tryParse(flatAreaRatio.text) == null) {
      showErrorNotification('Неверно введена поправка для площади квартиры');
      return true;
    }
    if (kitchenAreaRatio.text.isNotEmpty && double.tryParse(kitchenAreaRatio.text) == null) {
      showErrorNotification('Неверно введена поправка для площади кухни');
      return true;
    }
    if (balconyRatio.text.isNotEmpty && double.tryParse(balconyRatio.text) == null) {
      showErrorNotification('Неверно введена поправка для наличия балкона/лоджи');
      return true;
    }
    if (metroDistanceRatio.text.isNotEmpty && double.tryParse(metroDistanceRatio.text) == null) {
      showErrorNotification('Неверно введена поправка для расстояния от метро');
      return true;
    }
    if (conditionRatio.text.isNotEmpty && double.tryParse(conditionRatio.text) == null) {
      showErrorNotification('Неверно введена поправка для отделки');
      return true;
    }
    if (bargainRatio.text.isNotEmpty && double.tryParse(bargainRatio.text) == null) {
      showErrorNotification('Неверно введена поправка для торга');
      return true;
    }

    return false;
  }

  bool get _isEdited =>
      floorRatio.text != widget.initFloor ||
      flatAreaRatio.text != widget.initFlatArea ||
      kitchenAreaRatio.text != widget.initKitchenArea ||
      balconyRatio.text != widget.initBalcony ||
      metroDistanceRatio.text != widget.initMetro ||
      conditionRatio.text != widget.initCondition ||
      bargainRatio.text != widget.initBargain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Column(
            children: [
              const Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 600,
                        padding: const EdgeInsets.all(50),
                        decoration: BoxDecoration(
                          color: CustomColors.backgroundAccent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Аналог ${widget.id}',
                                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                              ),
                              Container(height: 30),
                              Text(
                                widget.analogue.position,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 18, color: CustomColors.brightAccent),
                              ),
                              const SizedBox(height: 5),
                              Text.rich(
                                TextSpan(
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'Количество комнат: '),
                                    TextSpan(
                                        text: widget.analogue.roomsCount.toString(),
                                        style: const TextStyle(color: CustomColors.brightAccent)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.analogue.segment,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 18, color: CustomColors.brightAccent),
                              ),
                              const SizedBox(height: 5),
                              Text.rich(
                                TextSpan(
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'Материал стен: '),
                                    TextSpan(
                                        text: widget.analogue.wallsMaterial,
                                        style: const TextStyle(color: CustomColors.brightAccent)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              FeatureRatio(
                                featureName: 'Этаж: ',
                                featureValue: '${widget.analogue.flatFloor}/${widget.analogue.floorsInHouse}',
                                hint: widget.hintFloor,
                                controller: floorRatio,
                              ),
                              FeatureRatio(
                                featureName: 'Площадь квартиры: ',
                                featureValue: '${widget.analogue.flatArea}м²',
                                hint: widget.hintFlatArea,
                                controller: flatAreaRatio,
                              ),
                              FeatureRatio(
                                featureName: 'Площадь кухни: ',
                                featureValue: '${widget.analogue.kitchenArea}м²',
                                hint: widget.hintKitchenArea,
                                controller: kitchenAreaRatio,
                              ),
                              FeatureRatio(
                                featureName: 'Балкон/лоджа: ',
                                featureValue: widget.analogue.hasBalcony,
                                hint: widget.hintBalcony,
                                controller: balconyRatio,
                              ),
                              FeatureRatio(
                                featureName: 'Удаленность от метро: ',
                                featureValue: '${widget.analogue.distanceFromMetro} мин.',
                                hint: widget.hintMetro,
                                controller: metroDistanceRatio,
                              ),
                              FeatureRatio(
                                featureName: 'Состояние: ',
                                featureValue: widget.analogue.condition,
                                hint: widget.hintCondition,
                                controller: conditionRatio,
                              ),
                              Container(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_isEdited)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          width: 250,
                          height: 70,
                          child: Button(
                            onTap: _onSubmit,
                            child: const Center(
                              child: Text(
                                'Применить',
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
        ],
      ),
    );
  }
}
