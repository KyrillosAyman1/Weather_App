import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/component_weather.dart';
import 'package:weather_app/widgets/list_view_days.dart';
import 'package:weather_app/widgets/weather_day.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
   var cubit = BlocProvider.of<GetWeatherCubit>(context);
    var weatherModel = cubit.weatherModel;
    //var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;


    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: getImage(weatherModel.weatherCondition),
                fit: BoxFit.cover, // تملى الشاشة كلها
              ),
            ),
          ),

         RefreshIndicator (
          onRefresh: () async {
             await cubit.getWeather(cityName: weatherModel.cityName);
             //final weatherCubit = GetWeatherCubit();
             //await weatherCubit.getWeather(cityName: weatherModel.cityName);
          },
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: WeatherDay()),
                ListViewDays(),
                SliverToBoxAdapter(child: WeatherComponent()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
String normalizeCondition(String input) {
  return input
   .trim()                       // يشيل المسافات من البداية والنهاية
      .toLowerCase()               // يحوّل الحروف لصغيرة
      .replaceAll(RegExp(r'[^\w\s]'), ''); // يشيل أي علامات ترقيم (.,!@#...)
}




AssetImage getImage(String condition) {
  condition = normalizeCondition(condition); // للتسهيل في المقارنة
  if (condition == "sunny" || condition == "clear") {
    return AssetImage("assets/images/4.jpg");
  } else if (condition == "partly cloudy" ||
      condition == "cloudy" ||
      condition == "overcast") {
    return AssetImage("assets/images/20.jpeg");
  } else if (condition == "mist" ||
      condition == "fog" ||
      condition == "freezing fog") {
    return AssetImage("assets/images/17.jpeg");
  } else if (condition.contains("drizzle") ||
      condition == "patchy light rain" ||
      condition == "light rain" ||
      condition == "patchy rain nearby") {
    return AssetImage("assets/images/16.jpeg");
  } else if (condition == "moderate rain" ||
      condition == "moderate rain at times" ||
      condition == "heavy rain" ||
      condition == "heavy rain at times") {
    return AssetImage("assets/images/22.jpeg");
  } else if (condition.contains("light snow") ||
      condition == "patchy light snow" ||
      condition == "patchy moderate snow") {
    return AssetImage("assets/images/20.jpeg");
  } else if (condition.contains("heavy snow") ||
      condition.contains("blizzard") ||
      condition == "moderate snow" ||
      condition == "patchy heavy snow") {
    return AssetImage("assets/images/3.jpg");
  } else if (condition.contains("thunder")) {
    return AssetImage("assets/images/22.jpeg");
  } else if (condition.contains("rain with thunder") ||
      condition.contains("light rain with thunder")) {
    return AssetImage("assets/images/16.jpeg");
  } else if (condition.contains("ice pellets") ||
      condition.contains("sleet") ||
      condition.contains("freezing")) {
    return AssetImage("assets/images/10.jpg");
  } else {
   return AssetImage("assets/images/16.jpeg");
  }
}





/*
Color getWeatherColor(String condition) {
  condition = normalizeCondition(condition); // تنظيف النص للمقارنة

  if (condition == "sunny" || condition == "clear") {
    return Colors.orange; // شمس
  } else if (condition == "partly cloudy" ||
      condition == "cloudy" ||
      condition == "overcast") {
    return Colors.blueGrey; // غائم
  } else if (condition == "mist" ||
      condition == "fog" ||
      condition == "freezing fog") {
    return Colors.grey.shade700; // ضباب
  } else if (condition.contains("drizzle") ||
      condition == "patchy light rain" ||
      condition == "light rain" ||
      condition == "patchy rain nearby") {
    return Colors.lightBlueAccent; // رذاذ خفيف
  } else if (condition == "moderate rain" ||
      condition == "moderate rain at times" ||
      condition == "heavy rain" ||
      condition == "heavy rain at times") {
    return Colors.blue; // مطر غزير
  } else if (condition.contains("light snow") ||
      condition == "patchy light snow" ||
      condition == "patchy moderate snow") {
    return Colors.indigo.shade100; // ثلوج خفيفة
  } else if (condition.contains("heavy snow") ||
      condition.contains("blizzard") ||
      condition == "moderate snow" ||
      condition == "patchy heavy snow") {
    return Colors.white70; // ثلوج كثيفة
  } else if (condition.contains("thunder")) {
    return Colors.deepPurple; // عواصف رعدية
  } else if (condition.contains("rain with thunder") ||
      condition.contains("light rain with thunder")) {
    return Colors.deepPurpleAccent; // مطر مع رعد
  } else if (condition.contains("ice pellets") ||
      condition.contains("sleet") ||
      condition.contains("freezing")) {
    return Colors.cyan.shade700; // برد/تجمّد
  } else {
    return Colors.brown; // حالة غير معروفة
  }
}*/
