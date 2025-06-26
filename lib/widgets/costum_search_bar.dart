import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/extensions/size_extension.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.mediumPadding),
        child: Center(
          child: TextField(
            textInputAction: TextInputAction.search,
            style: TextStyle(color: Colors.white),
            onSubmitted: (value) {
              if (value.trim().isEmpty) return;
              FocusScope.of(context).unfocus();
              BlocProvider.of<GetWeatherCubit>(
                context,
              ).getCurrentWeather(cityName: value);
            },
            decoration: InputDecoration(
              labelText: 'Search City',
              prefixIcon: Icon(Icons.search, color: Colors.white54),
              labelStyle: TextStyle(
                color: Colors.white54,
                fontSize: context.smallText,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.white54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.white54),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
