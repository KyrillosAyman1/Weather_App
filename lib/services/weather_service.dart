import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = "dbe28a8e1c0f4950b40105509232009";
  final String baseUrl = "https://api.weatherapi.com/v1";
  WeatherService(this.dio);

  Future<(WeatherModel, List<WeatherDaysModel>)> getCurrentWeather(
    final String cityName,
  ) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3",
      );

      final Map<String, dynamic> jsonData = response.data;

      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);

      List<dynamic> weatherDays = jsonData["forecast"]["forecastday"];

      List<WeatherDaysModel> weatherDaysList = [];

      for (var day in weatherDays) {
        WeatherDaysModel weatherDaysModel = WeatherDaysModel.fromJson(day);
        weatherDaysList.add(weatherDaysModel);
      }
      log(response.data.toString());
      return (weatherModel, weatherDaysList);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ??
          "There was an error , try later";
      throw (errorMessage);
    } catch (e) {
      log(e.toString());
      throw ("there was an error,tray later");
    }
  }
}



/**import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String apiKey = "dbe28a8e1c0f4950b40105509232009";
  final String baseUrl = "http://api.weatherapi.com/v1";
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather(final String cityName) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=14",
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data["error"]["message"] ??
          "There was an error , try later";
      throw (errorMessage);
    } catch (e) {
      log(e.toString());
      throw ("there was an error,tray later");
    }
  }






}
 */