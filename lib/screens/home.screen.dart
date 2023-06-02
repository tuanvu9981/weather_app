import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/apis/weather.api.dart';
import 'package:weather_app/models/single_hourly.model.dart';
import 'package:weather_app/models/weather.model.dart';
import 'package:weather_app/utils/convert.date.dart';
import 'package:weather_app/widgets/day_weather_row.dart';
import 'package:weather_app/widgets/hour_weather_column.dart';

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
    _fetchWeatherData();
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
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          color: const Color.fromARGB(255, 13, 83, 141),
          child: FutureBuilder<Weather?>(
            future: _fetchWeatherData(),
            builder: (context, AsyncSnapshot<Weather?> weather) {
              if (weather.hasData) {
                final currentWeather = weather.data!.current;
                final hourlyWeather = weather.data!.hourly;
                weather.data!.daily!.removeLast();
                final dailyWeather = weather.data!.daily;

                return CustomScrollView(slivers: [
                  const SliverAppBar(
                    elevation: 0,
                    floating: true,
                    backgroundColor: Color.fromARGB(255, 13, 83, 141),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          const Text(
                            "Hà Nội",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${currentWeather!.temp!.round().toString()}°",
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 65.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          currentWeather.weather![0].description!,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 50, 113, 165),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.all(15.0),
                        height: screenHeight * 0.175,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hourlyWeather!.length,
                          itemBuilder: ((context, index) {
                            SingleHour hourData = hourlyWeather[index];
                            return HourlyWeatherColumn(
                              iconUrl: hourData.weather![0].icon!,
                              hour: index == 0
                                  ? "Bây giờ"
                                  : getHourFromDt(hourData.dt!).toString(),
                              temp: double.parse(hourData.temp!.toString()),
                            );
                          }),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 50, 113, 165),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        padding: const EdgeInsets.all(15.0),
                        height: screenHeight * 0.475,
                        child: ListView(
                          children: dailyWeather!
                              .map((e) => DayWeatherRow(dayData: e))
                              .toList(),
                        ),
                      ),
                    ]),
                  ),
                ]);
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5.0,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
