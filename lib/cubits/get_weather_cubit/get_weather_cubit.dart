import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  WeatherModel? currentWeatherModel;
  GetWeatherCubit() : super(WeatherInitialState());
  Future<void> getCurrentWeather({required String cityName}) async {
    try {
      currentWeatherModel = await WeatherService(
        Dio(),
      ).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: currentWeatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }

  Future<void> getCurrentWeatherByLocation() async {
    try {
      emit(WeatherLoadingState());
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
      }
      LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
      );
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      String rawCityName = placemarks.first.administrativeArea ?? "Cairo";
      String cityName = cleanCityName(rawCityName);
      await getCurrentWeather(cityName: cityName);
    } catch (e) {
      emit(WeatherFailureState());
    }
  }

  String cleanCityName(String name) {
    final keywordsToRemove = [
      "Governorate",
      "محافظة",
      "Markaz",
      "قسم",
      "District",
      "Center",
    ];

    for (final keyword in keywordsToRemove) {
      name = name.replaceAll(keyword, "");
    }
    return name.trim();
  }
}
