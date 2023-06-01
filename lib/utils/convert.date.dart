int getHourFromDt(num weatherDt) {
  final validTime = int.parse(weatherDt.toString());
  final date = DateTime.fromMillisecondsSinceEpoch(validTime * 1000);
  return date.hour;
}
