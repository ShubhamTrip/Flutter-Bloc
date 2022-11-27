import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class FetchWeather extends SearchEvent{
  final city;
  FetchWeather(this.city);
  @override
  // TODO: implement props
  List<Object> get props => [city];
}

class ResetWeather extends SearchEvent{}