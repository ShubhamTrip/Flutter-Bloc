import 'package:equatable/equatable.dart';

import '../model/data_model.dart';

class WeatherState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherIsLoadingState extends WeatherState {}

class WeatherIsLoadedState extends WeatherState {
  final _weather;

  WeatherIsLoadedState(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WeatherNotLoadedState extends WeatherState {}
