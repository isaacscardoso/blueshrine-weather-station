import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/weather/weather.dart';
import '../utils/utils.dart';
import './pages.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String? _cityName = '';

  _initWeather() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherProvider>();
    });
  }

  @override
  void initState() {
    super.initState();
    _initWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final name = await navigateToPage(context, const SearchPage());
              setState(() {
                _cityName = name;
              });
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => navigateToPage(context, const SettingsPage()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text('City Name: $_cityName'),
        ),
      ),
    );
  }
}
