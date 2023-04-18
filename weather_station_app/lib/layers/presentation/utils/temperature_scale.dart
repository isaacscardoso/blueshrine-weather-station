import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class TemperatureScale {
  static double kelvinToCelsius(double temp) => (temp - 273.15);

  static double kelvinToFahrenheit(double temp) => ((temp - 273.15) * (9 / 5)) + 32;

  static String of(BuildContext context, {required double temperature}) {
    final TempScale tempScale = context.watch<TempSettingsState>().tempScale;
    if (tempScale == TempScale.fahrenheit) {
      return '${kelvinToFahrenheit(temperature).toStringAsFixed(2)}℉';
    }
    return '${kelvinToCelsius(temperature).toStringAsFixed(2)}℃';
  }
}
