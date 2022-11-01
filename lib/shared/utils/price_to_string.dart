String priceToString(int price) {
  return price.toString().replaceAllMapped(RegExp(r".{3}"), (match) => "${match.group(0)} ") + "₽";
}
