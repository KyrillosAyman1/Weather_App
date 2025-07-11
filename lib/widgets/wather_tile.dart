import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherTile extends StatelessWidget {
  const WeatherTile({super.key, required this.weatherDaysModel});
  final WeatherDaysModel weatherDaysModel;
  @override
  Widget build(BuildContext context) {
    //var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*.65,
        child: Card(
          
          color: Color.fromARGB(255, 251, 202, 167).withAlpha(
            (0.8 * 255).round(),
          ), // 0.0 = شفاف تمامًا، 1.0 = معتم تمامًا
          elevation: 0,
            
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
               
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
              children: [
                Text(
                  DateFormat.EEEE().format(
                    DateTime.parse(weatherDaysModel.date),
                  ),
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  weatherDaysModel.date,
            
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https:${weatherDaysModel.image ?? "https://play-lh.googleusercontent.com/e67fyhPdbhARNhMniiSLmkIhqj_kF-cH8KWC-dr8u5a_O_RNdylUcAyMeZWMJ_MAvA=w240-h480-rw"}",
                      //"https://play-lh.googleusercontent.com/e67fyhPdbhARNhMniiSLmkIhqj_kF-cH8KWC-dr8u5a_O_RNdylUcAyMeZWMJ_MAvA=w240-h480-rw",
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/cloudy.png"),
                      width: 100,
                      height: 100,
                    ),
            
                    Column(
                      children: [
                        Text(
                          "${weatherDaysModel.temp}°C",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
            
                        Text(
                          "Max: ${weatherDaysModel.maxTemp}°C",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Min: ${weatherDaysModel.minTemp}°C",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            
                Text(
                  weatherDaysModel.weatherCondition,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
