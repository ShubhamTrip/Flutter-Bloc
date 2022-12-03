import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/ui/homecontainer/bloc/weather_bloc.dart';
import 'package:weatherapp/src/ui/homecontainer/bloc/weather_state.dart';
import 'package:weatherapp/src/ui/homecontainer/repository/homecontainer_repository.dart';

import '../Show_weahter/Show_weather.dart';
import 'bloc/weather_event.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: BlocProvider(
          create: (context) => WeatherBloc(WeatherRepo()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  final weatherBloc = BlocProvider.of<WeatherBloc>(context);
                  if (state is WeatherInitialState) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: 32,
                        right: 32,
                      ),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            "Search Weather",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70),
                          ),
                          const Text(
                            "Instanly",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w200,
                                color: Colors.white70),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: cityController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white70,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.white70,
                                      style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      color: Colors.blue,
                                      style: BorderStyle.solid)),
                              hintText: "City Name",
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                            style: const TextStyle(color: Colors.white70),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                weatherBloc
                                    .add(FetchWeather(cityController.text));
                              },
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (state is WeatherIsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WeatherIsLoadedState) {
                    return ShowWeather(state.getWeather, cityController.text);
                  } else {
                    return Text(
                      "Error",
                      style: TextStyle(color: Colors.white),
                    );
                  }
                },
              ),
            ],
          )),
    );
  }
}
