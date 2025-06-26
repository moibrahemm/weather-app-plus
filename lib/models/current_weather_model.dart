import 'package:weather_app/models/hourly_forecast_model.dart';

class WeatherModel {
  final String cityName;
  final double currentTemp;
  final String condition;
  final String currentIconUrl;
  final double maxTemp;
  final double windkph;
  final int humidity;
  final List<HourlyForecastModel> hourlyForecast;

  WeatherModel({
    required this.cityName,
    required this.currentTemp,
    required this.condition,
    required this.currentIconUrl,
    required this.humidity,
    required this.maxTemp,
    required this.windkph,
    required this.hourlyForecast,
  });

  factory WeatherModel.fromJson(json) {
    List hourlyData = json['forecast']['forecastday'][0]['hour'];
    List<HourlyForecastModel> hourlyForecastList =
        hourlyData
            .map((hourlyJson) => HourlyForecastModel.fromJson(hourlyJson))
            .toList();
    return WeatherModel(
      cityName: json['location']['name'],
      condition: json['current']['condition']['text'],
      currentIconUrl: json['current']['condition']['icon'],
      currentTemp: json['current']['temp_c'],
      humidity: json['current']['humidity'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      windkph: json['current']['wind_kph'],
      hourlyForecast: hourlyForecastList,
    );
  }
}
