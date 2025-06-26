import 'package:flutter/material.dart';

final Map<String, List<Color>> weatherGradients = {
  'Sunny': [Color(0xFFB2EBF2), Color(0xFF81D4FA), Color(0xFF4FC3F7)],
  'Clear': [Color(0xFF020024), Color(0xFF090979), Color(0xFF1B263B)],
  'Partly cloudy': [Color(0xFFBFCACF), Color(0xFF8e9eab), Color(0xFFEEF2F3)],
  'Cloudy': [Color(0xFF757F9A), Color(0xFFAAB0BC), Color(0xFFD7DDE8)],
  'Overcast': [Color(0xFF5A5A5A), Color(0xFF7E7E7E), Color(0xFF9E9E9E)],
  'Mist': [Color(0xFFD3D3D3), Color(0xFFBDC3C7), Color(0xFF2C3E50)],
  'Fog': [Color(0xFFCED4DA), Color(0xFFADB5BD), Color(0xFF495057)],
  'Freezing fog': [Color(0xFFE0E0E0), Color(0xFFBDBDBD), Color(0xFF9E9E9E)],
  'Patchy rain nearby': [
    Color(0xFF87E0FD),
    Color(0xFF00C6FB),
    Color(0xFF005BEA),
  ],
  'Patchy rain possible': [
    Color(0xFF87E0FD),
    Color(0xFF00C6FB),
    Color(0xFF005BEA),
  ],
  'Light rain': [Color(0xFF87E0FD), Color(0xFF00C6FB), Color(0xFF005BEA)],
  'Moderate rain': [Color(0xFF5B86E5), Color(0xFF005BEA), Color(0xFF003973)],
  'Heavy rain': [Color(0xFF3A6073), Color(0xFF283E51), Color(0xFF1C1C1C)],
  'Torrential rain shower': [
    Color(0xFF1F1C2C),
    Color(0xFF0F2027),
    Color(0xFF2C5364),
  ],
  'Thundery outbreaks possible': [
    Color(0xFF2C3E50),
    Color(0xFF4CA1AF),
    Color(0xFF2B5876),
  ],
  'Patchy light rain with thunder': [
    Color(0xFF373B44),
    Color(0xFF4286f4),
    Color(0xFF1F3A93),
  ],
  'Moderate or heavy rain with thunder': [
    Color(0xFF0F2027),
    Color(0xFF203A43),
    Color(0xFF2C5364),
  ],
  'Patchy snow possible': [
    Color(0xFFF0F2F0),
    Color(0xFFE0E0E0),
    Color(0xFFBDBDBD),
  ],
  'Light snow': [Color(0xFFF4F9FF), Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
  'Heavy snow': [Color(0xFFE8F1F9), Color(0xFFDBE6F6), Color(0xFF9EBEDC)],
  'Blizzard': [Color(0xFFD6EAF8), Color(0xFFBBD2C5), Color(0xFF536976)],
  'Patchy light snow with thunder': [
    Color(0xFF3E5151),
    Color(0xFFDECBA4),
    Color(0xFFB79891),
  ],
  'Moderate or heavy snow with thunder': [
    Color(0xFF232526),
    Color(0xFF414345),
    Color(0xFF757575),
  ],
  'Patchy sleet possible': [
    Color(0xFF83a4d4),
    Color(0xFFb6fbff),
    Color(0xFFd4fc79),
  ],
  'Light sleet': [Color(0xFF90A4AE), Color(0xFF607D8B), Color(0xFFB0BEC5)],
  'Moderate or heavy sleet': [
    Color(0xFF455A64),
    Color(0xFF2C3E50),
    Color(0xFFBDC3C7),
  ],
  'Patchy light drizzle': [
    Color(0xFF92FE9D),
    Color(0xFF00C9FF),
    Color(0xFF2BC0E4),
  ],
  'Freezing drizzle': [Color(0xFFbdc3c7), Color(0xFF7F8C8D), Color(0xFF2c3e50)],
  'Heavy freezing drizzle': [
    Color(0xFF78909C),
    Color(0xFF536976),
    Color(0xFF292E49),
  ],
  'Ice pellets': [Color(0xFF485563), Color(0xFF3C3B3F), Color(0xFF29323c)],
  'Light showers of ice pellets': [
    Color(0xFF304352),
    Color(0xFF616161),
    Color(0xFFD7D2CC),
  ],
  'Moderate or heavy showers of ice pellets': [
    Color(0xFF0f2027),
    Color(0xFF203a43),
    Color(0xFF2c5364),
  ],
  'default': [
    Color.fromARGB(255, 66, 72, 74),
    Color.fromARGB(255, 46, 51, 54),
    Color.fromARGB(255, 0, 0, 0),
  ],
};

List<Color> getWeatherGradient(String? condition) =>
    weatherGradients[condition] ?? weatherGradients['default']!;
