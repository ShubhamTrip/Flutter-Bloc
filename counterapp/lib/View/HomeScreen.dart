import 'package:counterapp/Blocs/Counter_bloc.dart';
import 'package:counterapp/Blocs/Counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>CounterBLoc(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:BlocBuilder<CounterBLoc,int>(
            builder: (context,state){
              return Scaffold(

                body: Center(
                  child: Text("Hello ${state}")
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () => context.read<CounterBLoc>().add(CounterIncreamentEvent()), child: const Text('Increase')),
                      const SizedBox(width: 20,),
                      ElevatedButton(onPressed: () => context.read<CounterBLoc>().add(CounterDecreamentEvent()), child: const Text('Decrease'))
                    ],
                  ),
                )
              );
            },
          )
        )
      );
  }
}
