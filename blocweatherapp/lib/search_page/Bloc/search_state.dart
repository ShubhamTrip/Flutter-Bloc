import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/model.dart';

class SearchState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class WeatherInitialState extends SearchState{}

class WeatherIsLoading extends SearchState{}

class WeatherIsLoaded extends SearchState{
  final _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;

  @override
  // TODO: implement props
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends SearchState{}
