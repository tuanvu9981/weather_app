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
  // Weather? weather;

  Future<Weather?>? _fetchWeatherData() async {
    final weatherData = await WeatherApi.getWeather();
    // setState(() {
    //   weather = weatherData;
    // });
    // print(weatherData!.current);
    return weatherData;
  }

  @override
  void initState() {
    _fetchWeatherData();
    // timer = Timer.periodic(const Duration(minutes: 10), (timer) {
    //   _fetchWeatherData();
    //   setState(() {});
    // });
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
              final dataW = weather.data!;
              return ListView(
                children: [
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(dataW.current!.sunrise!.toString()) * 1000,
                    ).toString(),
                  ),
                  Text(
                    DateTime.fromMillisecondsSinceEpoch(
                      int.parse(dataW.current!.sunset!.toString()) * 1000,
                    ).toString(),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 36, 123, 194),
                  strokeWidth: 5.0,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
