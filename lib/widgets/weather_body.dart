import 'package:flutter/material.dart';
import 'package:weather_app/extensions/size_extension.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/utils/get_weather_icon.dart';
import 'package:weather_app/widgets/current_weather_widget.dart';
import 'package:weather_app/widgets/forecast_list_view.dart';
import 'package:weather_app/widgets/status_overview.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.currentWeatherModel});
  final WeatherModel currentWeatherModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.mediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrentWeatherWidget(
              city: currentWeatherModel.cityName,
              img: getWeatherIcon(currentWeatherModel.condition),
              status: currentWeatherModel.condition,
              temp: currentWeatherModel.currentTemp,
            ),
            Padding(
              padding: EdgeInsets.all(context.lowPadding),
              child: StatusOverview(),
            ),
            SizedBox(height: context.mediumPadding),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.white)),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: context.lowPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mediumPadding,
                        vertical: context.lowPadding,
                      ),
                      child: Center(
                        child: Text(
                          'Weather Forecast',
                          style: TextStyle(
                            fontSize: context.mediumText,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Divider(color: Colors.white70),
                    SizedBox(height: context.lowPadding * 0.4),
                    SizedBox(
                      height: context.width * 0.45,
                      child: ForecastListView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
