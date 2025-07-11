import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<GetWeatherCubit>(context).getCityWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff9b765c),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherIntialState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherCityState || state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else if (state is WeatherFailureState) {
            
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Text("${state.errMessage}.😔 search again..🔍" ,style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            );
          } else {
            return Center(child: Text("Unexpected error.."));
          }
        },
      ),
    );
  }
}
