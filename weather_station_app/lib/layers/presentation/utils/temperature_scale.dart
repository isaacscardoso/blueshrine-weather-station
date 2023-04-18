import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class TemperatureScale {
  static double convertToFahrenheit(double temp) => (temp * (9 / 5)) + 32;

  static String of(BuildContext context, {required double temperature}) {
    final TempScale tempScale = context.watch<TempSettingsState>().tempScale;
    if (tempScale == TempScale.fahrenheit) {
      return '${convertToFahrenheit(temperature).toStringAsFixed(2)}℉';
    }
    return '${temperature.toStringAsFixed(2)}℃';
  }
}
