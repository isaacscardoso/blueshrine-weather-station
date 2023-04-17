import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/weather/weather.dart';
import '../../providers/enums/enums.dart';

class WeatherData extends StatefulWidget {
  const WeatherData({super.key});

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  _initWeather() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>().initWeatherData();
    });
  }

  @override
  void initState() {
    super.initState();
    _initWeather();
  }

  @override
  Widget build(BuildContext context) {
    final weather = context.watch<WeatherProvider>().state.weather;
    return Text('Nome: ${weather?.name} - País: ${weather?.country}');
  }
}
