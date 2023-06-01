import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/apis/weather.api.dart';
import 'package:weather_app/models/weather.model.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Timer timer;
  Future<Weather?>? _fetchWeatherData() async {
    return await WeatherApi.getWeather();
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(minutes: 10), (timer) {
      _fetchWeatherData();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<Weather?>(
          future: _fetchWeatherData(),
          builder: (context, AsyncSnapshot<Weather?> weather) {
            if (weather.hasData) {
              return ListView();
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 36, 123, 194),
                strokeWidth: 5.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
