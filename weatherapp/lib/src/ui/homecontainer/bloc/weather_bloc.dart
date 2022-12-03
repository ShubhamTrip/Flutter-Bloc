import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/ui/homecontainer/bloc/weather_event.dart';
import 'package:weatherapp/src/ui/homecontainer/bloc/weather_state.dart';

import '../model/data_model.dart';
import '../repository/homecontainer_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherInitialState()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherIsLoadingState());

      try {
        WeatherModel weather = await weatherRepo.getWeather(event.city);
        emit(WeatherIsLoadedState(weather));
      } catch (_) {
        print(_);
        emit(WeatherNotLoadedState());
      }
    });
  }
}
