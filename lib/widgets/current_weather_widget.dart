import 'package:flutter/material.dart';
import 'package:weather_app/extensions/size_extension.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.city,
    required this.temp,
    required this.status,
    required this.img,
  });
  final String city;
  final double temp;
  final String status;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: context.largeText,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: context.lowPadding),
        Text(
          '${temp.round()}°C',
          style: TextStyle(
            fontSize: context.largeText * 1.8,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.lowPadding),
        Text(
          status,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: context.mediumText, color: Colors.white70),
        ),
        SizedBox(height: context.mediumPadding),
        Image.asset(
          img,
          fit: BoxFit.scaleDown,
          height: context.width * 0.4,
          width: context.width * 0.5,
          semanticLabel: 'Weather condition icon',
        ),
      ],
    );
  }
}
