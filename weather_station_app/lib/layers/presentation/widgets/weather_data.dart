import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/weather/weather.dart';

class WeatherData extends StatefulWidget {
  const WeatherData({super.key});

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  late final WeatherProvider _weatherProvider;

  @override
  void initState() {
    super.initState();
    _weatherProvider = context.read<WeatherProvider>();
    _weatherProvider.initWeatherData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = context.watch<WeatherState>().weather;
    return Text('Nome: ${weatherState?.name} - País: ${weatherState?.country}');
  }
}
