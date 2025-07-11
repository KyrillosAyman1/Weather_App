import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/widgets/card_item.dart';

class WeatherComponent extends StatelessWidget {
  const WeatherComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          
          Row(
            children: [
              CardItem(
                name:"Feels Like",
                data: "${weatherModel.feelsLike}°C",
              ),
              Spacer(),
              CardItem(
                name:"Clouds",
                data: "${weatherModel.cloud}",
              ),
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              CardItem(
                name: "Max Wind",
                data: "${weatherModel.maxWind} km",
              ),
              Spacer(),
              CardItem(
                name: "Precipitation",
                data: "${weatherModel.totalPrecip} mm",
              ),
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              CardItem(
                name: "Snow",
                data: "${weatherModel.totalSnow} cm",
              ),
              Spacer(),
              CardItem(
                name:"Humidity",
                data: "${weatherModel.avghumidity} %",
              ),
            ],
          ),
          SizedBox(height: 32),
          Row(
            children: [
              CardItem(name: "UV", data: "${weatherModel.uv}"),
              Spacer(),
              CardItem(name:"Visibility", data: "${weatherModel.avgvis} km"),
            ],
          ),
        ],
      ),
    );
  }
}
