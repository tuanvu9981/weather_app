import 'package:weather_app/models/current.model.dart';
import 'package:weather_app/models/single_day.dart';
import 'package:weather_app/models/single_hourly.model.dart';

class Weather {
  double? lat;
  double? lon;
  String? timezone;
  Current? current;
  List<SingleHour>? hourly; // 48 elements
  List<SingleDay>? daily; // 8 elements

  Weather({
    this.lat,
    this.lon,
    this.timezone,
    this.current,
    this.hourly,
    this.daily,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];

    if (json['hourly'] != null) {
      List<Map<String, dynamic>> mapHourly =
          json['hourly'].cast<Map<String, dynamic>>();
      hourly = mapHourly.map((a) => SingleHour.fromJson(a)).toList();
    }

    if (json['daily'] != null) {
      List<Map<String, dynamic>> mapDaily =
          json['daily'].cast<Map<String, dynamic>>();
      daily = mapDaily.map((a) => SingleDay.fromJson(a)).toList();
    }

    if (json['current'] != null) {
      current = Current.fromJson(json['current']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['timezone'] = timezone;

    if (hourly != null) {
      data['hourly'] = hourly!.map((v) => v.toJson()).toList();
    }

    if (daily != null) {
      data['daily'] = daily!.map((v) => v.toJson()).toList();
    }

    data['current'] = current!.toJson();
    return data;
  }
}
