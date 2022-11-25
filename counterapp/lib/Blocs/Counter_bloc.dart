import 'package:bloc/bloc.dart';
import 'package:counterapp/Blocs/Counter_event.dart';
import 'package:counterapp/Blocs/Counter_state.dart';

class CounterBLoc extends Bloc<CounterEvent, CounterState>{
  CounterBLoc(): super(CounterInitialState()){
    on<CounterIncreamentEvent>((event, emit) =>emit(CounterIncreamentState()));
    on<CounterDecreamentEvent>((event, emit) => emit(CounterDecreamentState()));
  }

}