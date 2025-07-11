import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherIntialState extends WeatherStates {}

class WeatherCityState extends WeatherStates {
  WeatherModel weatherModel;
  WeatherCityState(this.weatherModel);
}

class WeatherLoadedState extends WeatherStates {}

class WeatherFailureState extends WeatherStates {
  final dynamic errMessage;

  WeatherFailureState({required this.errMessage});
}
