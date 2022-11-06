enum Parameter {
  floor("typeOfFloor"),
  flatArea("typeOfArea"),
  kitchenArea("typeOfKitchenArea"),
  hasBalcony("typeOfBalcony"),
  distanceFromMetro("typeOfMetroTime"),
  condition("typeOfStatusFinish");

  final String value;

  const Parameter(this.value);

  static Parameter fromValue(String value) {
    switch (value) {
      case "typeOfFloor":
        return Parameter.floor;
      case "typeOfArea":
        return Parameter.flatArea;
      case "typeOfKitchenArea":
        return Parameter.kitchenArea;
      case "typeOfBalcony":
        return Parameter.hasBalcony;
      case "typeOfMetroTime":
        return Parameter.distanceFromMetro;
      case "typeOfStatusFinish":
        return Parameter.condition;
      default:
        return Parameter.floor;
    }
  }

  getPresentational() {
    switch (this) {
      case Parameter.floor:
        return "Этаж расположения квартиры";
      case Parameter.flatArea:
        return "Площадь квартиры (ед.изм. кв.м)";
      case Parameter.kitchenArea:
        return "Площадь кухни (ед.изм. кв.м)";
      case Parameter.hasBalcony:
        return "Наличие балкона/лоджи";
      case Parameter.distanceFromMetro:
        return "Расстояние до метро (ед.изм. мин./пешком)";
      case Parameter.condition:
        return "Состояние отделки";
      default:
        return "";
    }
  }
}
