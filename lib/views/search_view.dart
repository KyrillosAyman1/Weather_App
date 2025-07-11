import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController controller = TextEditingController();
  bool isLoading = false;

  void searchCity(String cityName) async {
    if (cityName.isEmpty) return;

    setState(() => isLoading = true);

    try {
      await BlocProvider.of<GetWeatherCubit>(
        context,
      ).getWeather(cityName: cityName);
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
       if (!mounted) return;
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Search error or city not found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search City",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff9b765c),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
           
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                onSubmitted: searchCity,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => searchCity(controller.text),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 26,
                    horizontal: 16,
                  ),
                  labelText: "Search Now",
                  hintText: "Enter city name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              isLoading? Center(child: CircularProgressIndicator()):
             Center(
               child: Text("No search yet",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Color(0xff9b765c),
               ),),
             )
            ],
          ),
        ),
      ),
    );
  }
}
 



/**import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get%20weather%20cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "search city",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff9b765c),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              TextField(
                controller: controller,
                onSubmitted: (value) {
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(
                    context,
                  );
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
                },

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      final value = controller.text;
                      if (value.isNotEmpty) {
                        BlocProvider.of<GetWeatherCubit>(
                          context,
                        ).getWeather(cityName: value);
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.search),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 26,
                    horizontal: 16,
                  ),
                  labelText: "Search Now",
                  hintText: "Enter city name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),


              
            ],
          ),
        ),
      ),
    );
  }
} */