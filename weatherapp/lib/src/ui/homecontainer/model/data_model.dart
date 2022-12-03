class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final temp_max;
  final temp_min;

  double get getTemp => temp - 272.5;
  double get getMaxTemp => temp_max - 272.5;
  double get getMinTemp => temp_min - 272.5;

  WeatherModel(
      {required this.humidity,
      required this.pressure,
      required this.temp,
      required this.temp_max,
      required this.temp_min});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        humidity: json['humidity'],
        pressure: json['pressure'],
        temp: json['temp'],
        temp_max: json['temp_max'],
        temp_min: json['temp_min']);
  }
}
