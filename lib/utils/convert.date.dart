int getHourFromDt(num weatherDt) {
  final validTime = int.parse(weatherDt.toString());
  final date = DateTime.fromMillisecondsSinceEpoch(validTime * 1000);
  return date.hour;
}

int getWeekDayFromDt(num weatherDt) {
  final validTime = int.parse(weatherDt.toString());
  final date = DateTime.fromMillisecondsSinceEpoch(validTime * 1000);
  return date.weekday;
}

String convertWeekDayToString(int weekDay) {
  switch (weekDay) {
    case 1:
      return 'Th2';
    case 2:
      return 'Th3';
    case 3:
      return 'Th4';
    case 4:
      return 'Th5';
    case 5:
      return 'Th6';
    case 6:
      return 'Th7';
    case 7:
      return 'CN';
    default:
      return '';
  }
}
