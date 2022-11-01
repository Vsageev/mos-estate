enum Parameter {
  floor("floor"),
  flatArea("flatArea"),
  kitchenArea("kitchenArea"),
  hasBalcony("hasBalcony"),
  distanceFromMetro("distanceFromMetro"),
  condition("condition");

  final String value;

  const Parameter(this.value);

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
