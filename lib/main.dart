import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/data/weather_api.dart';
import 'package:simple_weather_app/views/weather_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/rain.png"), context);
    return Provider<WeatherApi>(
      create: (context) => WeatherApi(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Weather()
      ),
    );
  }
}
