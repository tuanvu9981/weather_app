import 'dart:convert';

import 'package:weather_app/models/weather.model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'base.api.dart';

class WeatherApi {
  static Future<Weather?>? getWeather() async {
    var response = await get(
      Uri.https(BaseApi.baseUrl, BaseApi.path, {
        'units': 'metric',
        'lang': 'vi',
        'lat': double.parse(dotenv.env['HANOI_LATITUDE']!),
        'lon': double.parse(dotenv.env['HANOI_LONGTITUDE']!),
        'appid': dotenv.env['WEATHER_APP_ID'],
        'exclude': 'minutely',
      }),
      headers: BaseApi.headers,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> newMapData = jsonDecode(response.body);
      return Weather.fromJson(newMapData);
    }
    return null;
  }
}
