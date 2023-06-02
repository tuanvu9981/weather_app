import 'package:flutter/material.dart';
import 'package:weather_app/models/single_day.dart';
import 'package:weather_app/utils/convert.date.dart';

class DayWeatherRow extends StatelessWidget {
  final SingleDay dayData;
  const DayWeatherRow({super.key, required this.dayData});
  final tempStyle = const TextStyle(color: Colors.white, fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    // icon
    String iconUrl = dayData.weather![0].icon!;

    // rounded min & max temparature
    var minTemp = double.parse(dayData.temp!.min.toString()).round();
    var maxTemp = double.parse(dayData.temp!.max.toString()).round();

    // current String date
    DateTime dateNow = DateTime.now();
    int weekDay = getWeekDayFromDt(dayData.dt!);
    String weekDayString = dateNow.weekday == weekDay
        ? "Hôm nay"
        : convertWeekDayToString(weekDay);

    return Container(
      height: 60.0,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weekDayString,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 50, 113, 165),
                    BlendMode.color,
                  ),
                  child: Image.network(
                    "https://openweathermap.org/img/wn/$iconUrl@2x.png",
                    width: 65.0,
                    height: 65.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$minTemp°C", style: tempStyle),
                Container(
                  height: 1.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightGreen,
                        Colors.orangeAccent,
                        Colors.yellow,
                      ],
                    ),
                  ),
                ),
                Text("$maxTemp°C", style: tempStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
