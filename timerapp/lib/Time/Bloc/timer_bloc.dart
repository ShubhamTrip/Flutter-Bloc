import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timerapp/Time/Bloc/timer_event.dart';
import 'package:timerapp/Time/Bloc/timer_state.dart';

class TimerBloc extends Bloc<TimerEvent,TimerState> {

  TimerBloc() : super(TimerInitialState()) {

    on<TimerStarted>((event, emit) => null);
    on<TimerReset>((event, emit) => null);
    on<TimerResumed>((event, emit) => null);

  }

}
