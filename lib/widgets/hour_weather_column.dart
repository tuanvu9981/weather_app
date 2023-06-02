import 'package:flutter/material.dart';

class HourlyWeatherColumn extends StatelessWidget {
  final String iconUrl;
  final String hour;
  final double temp;
  const HourlyWeatherColumn({
    super.key,
    required this.iconUrl,
    required this.hour,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hour == "Bây giờ" ? hour : "${hour}h",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Color.fromARGB(255, 50, 113, 165),
              BlendMode.color,
            ),
            child: Image.network(
              "https://openweathermap.org/img/wn/${iconUrl}@2x.png",
            ),
          ),
          Text(
            "${temp.round().toString()}°C",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
