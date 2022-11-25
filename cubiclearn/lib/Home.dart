import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/cubit.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<CounterCubit,int>(
            builder: (context,state){
              return Text("$state");
            },
          )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              onPressed: ()=> context.read<CounterCubit>().increase(),
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed:()=> context.read<CounterCubit>().decrease()
          )
        ],
      ),
    );
  }
}
