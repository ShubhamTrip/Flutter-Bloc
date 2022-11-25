import 'package:bloc/bloc.dart';
import 'package:counterapp/Blocs/Counter_event.dart';

class CounterBLoc extends Bloc<CounterEvent, int>{
  CounterBLoc(): super(0){
    on<CounterIncreamentEvent>((event, emit) =>emit(state+1));
    on<CounterDecreamentEvent>((event, emit) => emit(state-1));
  }
}