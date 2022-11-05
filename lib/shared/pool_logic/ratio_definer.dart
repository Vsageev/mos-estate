class RatioDefiner {
  static int floor(int floor, int maxFloor) {
    if (floor == maxFloor) {
      return 2;
    }
    if (floor == 1) {
      return 0;
    }
    return 1;
  }

  static int flatArea(double area) {
    if (area < 30) {
      return 0;
    }
    if (area < 50) {
      return 1;
    }
    if (area < 65) {
      return 2;
    }
    if (area < 90) {
      return 3;
    }
    if (area < 120) {
      return 4;
    }
    return 5;
  }

  static int kitchenArea(double area) {
    if (area < 7) {
      return 0;
    }
    if (area < 10) {
      return 1;
    }
    return 2;
  }

  static int balcony(String value) {
    switch (value.toLowerCase()) {
      case "да":
        return 1;
      default:
        return 0;
    }
  }

  static int metro(int value) {
    if (value < 5) {
      return 0;
    }
    if (value < 10) {
      return 1;
    }
    if (value < 15) {
      return 2;
    }
    if (value < 30) {
      return 3;
    }
    if (value < 60) {
      return 4;
    }
    return 5;
  }

  static int condition(String value) {
    switch (value.toLowerCase()) {
      case "без отделки":
        return 0;
      case "муниципальный ремонт":
        return 1;
      default:
        return 2;
    }
  }
}
