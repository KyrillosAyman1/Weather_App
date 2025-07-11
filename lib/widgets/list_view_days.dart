import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';

import 'package:weather_app/widgets/wather_tile.dart';

class ListViewDays extends StatelessWidget {
  const ListViewDays({super.key});

  @override
  Widget build(BuildContext context) {
    
    var weatherList = BlocProvider.of<GetWeatherCubit>(context).weatherDaysList;
    return SliverToBoxAdapter(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isPortrait = constraints.maxHeight > constraints.maxWidth;
          final height = isPortrait ? 350.0 : 250.0;
          return SizedBox(
           
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weatherList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return WeatherTile(weatherDaysModel: weatherList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
