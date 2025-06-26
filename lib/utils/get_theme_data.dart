import 'package:flutter/material.dart';
import 'weather_gradient.dart';

ThemeData getThemeData(String? condition) {
  final conditionColors = getWeatherGradient(condition);
  final conditionPrimaryColor = conditionColors.first;
  final conditionBrightness = conditionPrimaryColor.computeLuminance() < 0.5;

  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: conditionBrightness ? Colors.white : Colors.black,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: conditionBrightness ? Colors.white : Colors.black,
      ),
      bodyMedium: TextStyle(
        color: conditionBrightness ? Colors.white : Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: conditionBrightness ? Colors.white : Colors.black,
    ),
  );
}
