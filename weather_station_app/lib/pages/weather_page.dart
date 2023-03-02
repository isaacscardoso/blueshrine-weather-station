import 'package:flutter/material.dart';

import '../pages/utils/utils.dart';
import '../pages/pages.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: <Widget>[
          IconButton(
            onPressed: () => navigateToPage(context, const SearchPage()),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => navigateToPage(context, const SettingsPage()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Weather Station Home Page.'),
        ),
      ),
    );
  }
}
