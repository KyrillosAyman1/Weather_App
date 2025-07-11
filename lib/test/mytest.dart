/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';


class test extends StatefulWidget {
  const test({super.key});

  @override
  State<WeatherInfoBody> createState() => _WeatherInfoBodyState();
}

class _WeatherInfoBodyState extends State<WeatherInfoBody> {
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  weatherModel.cityName,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "https:${ weatherModel.image}", //"https://play-lh.googleusercontent.com/e67fyhPdbhARNhMniiSLmkIhqj_kF-cH8KWC-dr8u5a_O_RNdylUcAyMeZWMJ_MAvA=w240-h480-rw",
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset("assets/images/cloudy.png"),
                      width: 100,
                      height: 100,
                    ),
                    
                    Spacer(),
                    Text(
                      "${weatherModel.temp.round()}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          "MaxTemp ${weatherModel.maxTemp.round()}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "MinTemp ${weatherModel.minTemp.round()}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  "${weatherModel.weatherCondition}",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
