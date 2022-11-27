import 'package:blocweatherapp/search_page/Bloc/search_event.dart';
import 'package:blocweatherapp/search_page/Bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/model.dart';
import '../search_repo.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{

  WeatherRepo weatherRepo;
  SearchBloc(this.weatherRepo) : super(WeatherInitialState()){

    on<FetchWeather>((event, emit) async {

      emit( WeatherIsLoading());

      try{
        WeatherModel weather = await weatherRepo.getWeather(event.city);
        emit (WeatherIsLoaded(weather));
      }catch(_){
        print(_);
        emit(WeatherIsNotLoaded());
      }

    });


  }



}