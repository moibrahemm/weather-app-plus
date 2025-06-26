import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/extensions/size_extension.dart';
import 'package:weather_app/utils/weather_gradient.dart';
import 'package:weather_app/widgets/animated_loading_text.dart';
import 'package:weather_app/widgets/costum_search_bar.dart';
import 'package:weather_app/widgets/weather_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetWeatherCubit>(context).getCurrentWeatherByLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is WeatherLoadingState || state is WeatherInitialState) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 16.0),
                  AnimatedLoadingText(),
                ],
              ),
            ),
          );
        } else if (state is WeatherLoadedState) {
          final condition = state.weatherModel.condition;

          return Stack(
            children: [
              // Gradient background
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: getWeatherGradient(condition),
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              // Main UI
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(elevation: 0, flexibleSpace: CustomSearchBar()),
                body: AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  child: WeatherBody(currentWeatherModel: state.weatherModel),
                ),
              ),
            ],
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text(
                'There was an error, try again later',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.mediumText,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
