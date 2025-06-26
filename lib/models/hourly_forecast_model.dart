class HourlyForecastModel {
  final String hour;
  final double temperature;
  final String iconUrl;

  const HourlyForecastModel({
    required this.hour,
    required this.temperature,
    required this.iconUrl,
  });
  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) {
    return HourlyForecastModel(
      hour: json['time'],
      temperature: json['temp_c'],
      iconUrl: json['condition']['icon'],
    );
  }
}
