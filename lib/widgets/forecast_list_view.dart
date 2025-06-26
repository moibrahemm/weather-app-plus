import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/extensions/size_extension.dart';
import 'package:weather_app/models/hourly_forecast_model.dart';
import 'package:weather_app/utils/weather_gradient.dart';

class ForecastListView extends StatelessWidget {
  const ForecastListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HourlyForecastModel> hourlyForecasts =
        BlocProvider.of<GetWeatherCubit>(
          context,
        ).currentWeatherModel!.hourlyForecast.cast<HourlyForecastModel>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: hourlyForecasts.length,
      itemBuilder: (context, index) {
        final hour = hourlyForecasts[index];
        final dateTime = DateTime.parse(hour.hour);
        final int hour12 = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
        final String period = dateTime.hour >= 12 ? 'PM' : 'AM';
        final formattedTime = '$hour12 $period';
        final isNow = dateTime.hour == DateTime.now().hour;
        final Color primaryColor =
            getWeatherGradient(
              BlocProvider.of<GetWeatherCubit>(
                context,
              ).currentWeatherModel!.condition,
            )[2];
        final backGroundColor = isNow ? primaryColor : Colors.black38;

        return Padding(
          padding: EdgeInsets.only(
            top: context.lowPadding * 0.7,
            bottom: context.lowPadding * 0.7,
            right: context.lowPadding * 1.5,
            left: context.lowPadding * 1.5,
          ),
          child: SizedBox(
            width: context.width * 0.2,
            child: Container(
              padding: EdgeInsets.all(context.lowPadding * 1.8),
              decoration: BoxDecoration(
                color: backGroundColor,
                borderRadius: BorderRadius.circular(40),
                boxShadow:
                    isNow
                        ? [BoxShadow(color: Colors.black26, blurRadius: 5)]
                        : [],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formattedTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: context.smallText,
                    ),
                  ),
                  SizedBox(height: context.lowPadding),
                  Image.network(
                    "https:${hourlyForecasts[index].iconUrl}",
                    width: context.width * 0.12,
                    height: context.width * 0.12,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            Icon(Icons.cloud_off, color: Colors.white),
                  ),
                  SizedBox(height: context.lowPadding),
                  Text(
                    "${hourlyForecasts[index].temperature.round()}°C",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: context.smallText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
