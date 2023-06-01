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
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: 65.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hour,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              //Colors.teal.withOpacity(0.7),
              Color.fromARGB(255, 163, 162, 162),
              BlendMode.color,
            ),
            child: Image.network(
              "https://openweathermap.org/img/wn/${iconUrl}@2x.png",
            ),
          ),
          Text(
            "${temp.toString()}°",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
