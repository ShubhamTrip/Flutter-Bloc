import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit(int a): super(a);

  void increase()=> emit(state +1);
  void decrease(){

    if(state>0){
      return emit(state-1);
    }

  }

}