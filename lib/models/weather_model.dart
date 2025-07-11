class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final double maxWind;
  final double totalPrecip;
  final double avgvis;
  final int avghumidity;
  final double totalSnow;
  final double uv;
  final double feelsLike;
  final int cloud;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,

    required this.maxWind,
    required this.totalPrecip,
    required this.avgvis,
    required this.avghumidity,
    required this.totalSnow,
    required this.uv,
    required this.feelsLike,
    required this.cloud,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json["location"]["localtime"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherCondition:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      maxWind: json["forecast"]["forecastday"][0]["day"]["maxwind_kph"],
      totalPrecip: json["forecast"]["forecastday"][0]["day"]["totalprecip_mm"],
      avgvis: json["forecast"]["forecastday"][0]["day"]["avgvis_km"],
      avghumidity: json["forecast"]["forecastday"][0]["day"]["avghumidity"],
      totalSnow: json["forecast"]["forecastday"][0]["day"]["totalsnow_cm"],
      uv: json["forecast"]["forecastday"][0]["day"]["uv"],
      feelsLike: json["current"]["feelslike_c"],
      cloud: json["current"]["cloud"],
    );
  }
}

class WeatherDaysModel {
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherDaysModel({
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherDaysModel.fromJson(Map<String, dynamic> json) {
    return WeatherDaysModel(
      date: json["date"],
      temp: json["day"]["avgtemp_c"],
      maxTemp: json["day"]["maxtemp_c"],
      minTemp: json["day"]["mintemp_c"],
      weatherCondition: json["day"]["condition"]["text"],
      image: json["day"]["condition"]["icon"],
    );
  }
}
