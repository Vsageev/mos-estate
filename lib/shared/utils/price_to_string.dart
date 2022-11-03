String priceToString(int price) {
  String temp = price.toString();
  for (var i = temp.length - 2; i > 0; i -= 3) {
    temp = temp.replaceRange(i - 1, null, " ${temp.substring(i - 1)}");
  }
  return "$temp ₽";
}
