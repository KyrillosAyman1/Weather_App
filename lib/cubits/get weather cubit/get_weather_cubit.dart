import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherIntialState());
  late WeatherModel weatherModel;
  late List<WeatherDaysModel> weatherDaysList;
  Future<void> getWeather({required String cityName}) async {
    try {
      final service = WeatherService(Dio());
      final (weather, days) = await service.getCurrentWeather(cityName);
      weatherModel = weather;
      weatherDaysList = days;

      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState(errMessage: e.toString()));
    }
  }

  getCityWeather() async {
    try {
      final service = WeatherService(Dio());
      final (weather, days) = await service.getCurrentWeather("sohag");
      weatherModel = weather;
      weatherDaysList = days;
      emit(WeatherCityState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState(errMessage: e.toString()));
    }
  }
}




/**import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(WeatherIntialState());
  late WeatherModel weatherModel;
  late List<WeatherDaysModel> weatherDaysList;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName);

      weatherDaysList = await WeatherService(Dio()).getDaystWeather(cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState(
        errMessage: e.toString()
        
      ));
    }
  }

  getCityWeather() async {
    try {
      weatherModel = await WeatherService(Dio()).getCurrentWeather("sohag");
       weatherDaysList = await WeatherService(Dio()).getDaystWeather("sohag");
       emit(WeatherCityState(weatherModel));
    } catch (e) {
      emit(WeatherFailureState(
        errMessage: e.toString()
      ));
    }
  }
}
 */