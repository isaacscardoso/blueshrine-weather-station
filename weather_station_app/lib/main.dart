import 'package:flutter/material.dart';

import './pages/pages.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WeatherPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
