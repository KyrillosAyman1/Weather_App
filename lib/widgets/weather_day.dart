import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';

class WeatherDay extends StatelessWidget {
  const WeatherDay({super.key});

  @override
  Widget build(BuildContext context) {
    
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    final formattedTime = DateFormat.jm().format(weatherModel.date);
    

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white.withAlpha((0.3 * 255).round()),
        // 0.0 = شفاف تمامًا، 1.0 = معتم تمامًا
        elevation: 0,
    
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                //overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 12),
    
              Text(
                "Updated at $formattedTime",
    
                //"Updated at ${(weatherModel.date.hour == 0 ? 12 : (weatherModel.date.hour > 12 ? weatherModel.date.hour - 12 : weatherModel.date.hour))}:${weatherModel.date.minute.toString().padLeft(2, '0')} ${weatherModel.date.hour >= 12 ? 'PM' : 'AM'}",
    
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                " ${weatherModel.date.year}-${weatherModel.date.month.toString().padLeft(2, '0')}-${weatherModel.date.day.toString().padLeft(2, '0')}",
    
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https:${weatherModel.image ?? "https://play-lh.googleusercontent.com/e67fyhPdbhARNhMniiSLmkIhqj_kF-cH8KWC-dr8u5a_O_RNdylUcAyMeZWMJ_MAvA=w240-h480-rw"}",
                    //"https://play-lh.googleusercontent.com/e67fyhPdbhARNhMniiSLmkIhqj_kF-cH8KWC-dr8u5a_O_RNdylUcAyMeZWMJ_MAvA=w240-h480-rw",
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/cloudy.png"),
                    width: 100,
                    height: 100,
                  ),
    
                  Spacer(flex: 1),
                  Text(
                    "${weatherModel.temp}°C",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(flex: 2),
                  Column(
                    children: [
                      Text(
                        "Max: ${weatherModel.maxTemp}°C",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Min: ${weatherModel.minTemp}°C",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
    
              Text(
                weatherModel.weatherCondition,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
