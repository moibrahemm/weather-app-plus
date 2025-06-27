String getWeatherIcon(String condition) {
  switch (condition) {
    case 'Sunny':
      return 'assets/icons/sunny.png';

    case 'Clear':
      return 'assets/icons/night_clear.png';

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return 'assets/icons/cloudy.png';

    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Patchy light rain':
    case 'Light drizzle':
    case 'Light rain':
    case 'Light rain shower':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Moderate rain at times':
    case 'Heavy rain at times':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return 'assets/icons/rain.png';
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return 'assets/icons/thunder.png';

    default:
      return 'assets/icons/sunny.png';
  }
}
