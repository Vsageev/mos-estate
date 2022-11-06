import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mos_estate/pages/standart_calculation/analogue.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/analogue_picture.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/condition_feature_adjustment.dart';
import 'package:mos_estate/pages/standart_calculation/analogue_popup/feature_ratio.dart';
import 'package:mos_estate/pages/standart_calculation/ratios.dart';
import 'package:mos_estate/shared/constants/colors.dart';
import 'package:mos_estate/shared/constants/parameters.dart';
import 'package:mos_estate/shared/utils/price_to_string.dart';
import 'package:mos_estate/shared/widget/button.dart';
import 'package:mos_estate/shared/widget/show_error_notification.dart';

class AnalogueRatiosPopup extends StatefulWidget {
  AnalogueRatiosPopup(
      {super.key,
      required this.analogue,
      required this.updateUI,
      required this.id,
      required this.defaultBargainRatio,
      required this.defaultConditionAdjustments,
      required this.defaultRatios}) {
    hintFloor = _getHintText(Parameter.floor);
    hintFlatArea = _getHintText(Parameter.flatArea);
    hintKitchenArea = _getHintText(Parameter.kitchenArea);
    hintBalcony = _getHintText(Parameter.hasBalcony);
    hintMetro = _getHintText(Parameter.distanceFromMetro);
    hintCondition = defaultConditionAdjustments.values[analogue.conditionCoordinates.row]
            [analogue.conditionCoordinates.column]
        .toString();
    hintBargain = "${defaultBargainRatio.value! * 100} %";

    initFloor = _getRatioInitText(analogue.ratios[Parameter.floor]);
    initFlatArea = _getRatioInitText(analogue.ratios[Parameter.flatArea]);
    initKitchenArea = _getRatioInitText(analogue.ratios[Parameter.kitchenArea]);
    initBalcony = _getRatioInitText(analogue.ratios[Parameter.hasBalcony]);
    initMetro = _getRatioInitText(analogue.ratios[Parameter.distanceFromMetro]);
    initCondition = analogue.conditionAdjustment.value != null ? analogue.conditionAdjustment.value.toString() : "";
    initBargain = _getRatioInitText(analogue.bargainRatio.value);
  }

  String _getHintText(Parameter parameter) {
    return "${(defaultRatios[parameter]!.values[analogue.ratiosCoordinates[parameter]!.row][analogue.ratiosCoordinates[parameter]!.column] * 100).toStringAsFixed(1)} %";
  }

  String _getRatioInitText(double? ratio) {
    return ratio != null ? "${(ratio * 100).toStringAsFixed(1)}%" : "";
  }

  final Analogue analogue;
  final Function updateUI;
  final int id;

  final BargainRatio defaultBargainRatio;
  final ConditionAdjustments defaultConditionAdjustments;
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

  final carouselController = CarouselController();

  int imageId = 0;

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

    widget.analogue.ratios[Parameter.floor] = _getValue(floorRatio);
    widget.analogue.ratios[Parameter.flatArea] = _getValue(flatAreaRatio);
    widget.analogue.ratios[Parameter.kitchenArea] = _getValue(kitchenAreaRatio);
    widget.analogue.ratios[Parameter.hasBalcony] = _getValue(balconyRatio);
    widget.analogue.ratios[Parameter.distanceFromMetro] = _getValue(metroDistanceRatio);
    widget.analogue.conditionAdjustment.value = _getConditionValue(conditionRatio);
    widget.analogue.bargainRatio.value = _getValue(bargainRatio);

    Navigator.pop(context);
  }

  int? _getConditionValue(TextEditingController controller) {
    if (controller.text != "") {
      return int.tryParse(controller.text);
    }

    return null;
  }

  double? _getValue(TextEditingController controller) {
    if (controller.text.length > 1) {
      final temp = double.tryParse(controller.text.substring(0, controller.text.length - 1));

      if (temp != null) {
        return temp / 100;
      }
    }
    return null;
  }

  bool _hasErrors() {
    if (floorRatio.text.isNotEmpty && _getValue(floorRatio) == null) {
      showErrorNotification('Неверно введена поправка для этажа');
      return true;
    }
    if (flatAreaRatio.text.isNotEmpty && _getValue(flatAreaRatio) == null) {
      showErrorNotification('Неверно введена поправка для площади квартиры');
      return true;
    }
    if (kitchenAreaRatio.text.isNotEmpty && _getValue(kitchenAreaRatio) == null) {
      showErrorNotification('Неверно введена поправка для площади кухни');
      return true;
    }
    if (balconyRatio.text.isNotEmpty && _getValue(balconyRatio) == null) {
      showErrorNotification('Неверно введена поправка для наличия балкона/лоджи');
      return true;
    }
    if (metroDistanceRatio.text.isNotEmpty && _getValue(metroDistanceRatio) == null) {
      showErrorNotification('Неверно введена поправка для расстояния от метро');
      return true;
    }
    if (conditionRatio.text.isNotEmpty && _getConditionValue(conditionRatio) == null) {
      showErrorNotification('Неверно введена поправка для отделки');
      return true;
    }
    if (bargainRatio.text.isNotEmpty && _getValue(bargainRatio) == null) {
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

  int _getPrice() {
    final bargainRatio = widget.defaultBargainRatio;
    final conditionAdjustment = widget.defaultConditionAdjustments;
    final ratios = widget.defaultRatios;

    var tempPrice = widget.analogue.price.toDouble();
    for (var p in Parameter.values) {
      tempPrice *= (1 +
          (widget.analogue.ratios[p] ??
              ratios[p]!.values[widget.analogue.ratiosCoordinates[p]!.row]
                  [widget.analogue.ratiosCoordinates[p]!.column]));
    }
    tempPrice *= 1 + (widget.analogue.bargainRatio.value ?? bargainRatio.value!);

    tempPrice += (widget.analogue.conditionAdjustment.value ??
            conditionAdjustment.values[widget.analogue.conditionCoordinates.row]
                [widget.analogue.conditionCoordinates.column]) *
        widget.analogue.flatArea;

    return tempPrice.toInt();
  }

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
                        width: 650,
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
                              Container(height: 20),
                              Container(
                                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                                color: Colors.black,
                                child: Column(
                                  children: [
                                    CarouselSlider(
                                      items: widget.analogue.imageUrls.map((e) => AnaloguePictue(url: e)).toList(),
                                      carouselController: carouselController,
                                      options: CarouselOptions(
                                          enlargeCenterPage: true,
                                          aspectRatio: 2.0,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              imageId = index;
                                            });
                                          }),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        widget.analogue.imageUrls.length,
                                        (index) => Container(
                                            width: 10.0,
                                            height: 10.0,
                                            margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 4.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white.withOpacity(imageId == index ? 1.0 : 0.5))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(height: 15),
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
                                featureName: 'Поправка на торг: ',
                                featureValue: '',
                                hint: widget.hintBargain,
                                controller: bargainRatio,
                              ),
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
                              ConditionFeatureAdgustment(
                                featureName: 'Состояние: ',
                                featureValue: widget.analogue.condition,
                                hint: widget.hintCondition,
                                controller: conditionRatio,
                              ),
                              Container(height: 20),
                              Text.rich(
                                TextSpan(
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'Цена до поправок: '),
                                    TextSpan(
                                        text: priceToString(widget.analogue.price),
                                        style: const TextStyle(color: CustomColors.brightAccent)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text.rich(
                                TextSpan(
                                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                                  children: <TextSpan>[
                                    const TextSpan(text: 'Цена после поправок: '),
                                    TextSpan(
                                        text: priceToString(_getPrice()),
                                        style: const TextStyle(color: CustomColors.brightAccent)),
                                  ],
                                ),
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
