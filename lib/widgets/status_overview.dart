import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/extensions/size_extension.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/widgets/status_item.dart';

class StatusOverview extends StatelessWidget {
  const StatusOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherModel currentWeatherModel =
        BlocProvider.of<GetWeatherCubit>(context).currentWeatherModel!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.lowPadding),
      decoration: BoxDecoration(
        color: Colors.black38,
        boxShadow: const [
          BoxShadow(color: Colors.white12, blurRadius: 5, spreadRadius: 3.5),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.lowPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatusItem(
              url: 'https://cdn-icons-png.flaticon.com/512/5538/5538701.png',
              value: '${currentWeatherModel.maxTemp.round()} °C',
              itemName: 'Max Temp',
            ),
            StatusItem(
              url: 'https://cdn-icons-png.flaticon.com/512/3944/3944594.png',
              value: '${currentWeatherModel.windkph} kph',
              itemName: 'Wind',
            ),
            StatusItem(
              url: 'https://cdn-icons-png.flaticon.com/512/9342/9342439.png',
              value: '${currentWeatherModel.humidity} %',
              itemName: 'Humidity',
            ),
          ],
        ),
      ),
    );
  }
}
