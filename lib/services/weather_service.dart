import 'package:dio/dio.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/secrets.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = weatherApiKey;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMsg =
          e.response?.data['error']['message'] ??
          'There was an error, try again later';
      throw Exception(errMsg);
    } catch (e) {
      throw Exception('There was an error, try again later');
    }
  }
}
