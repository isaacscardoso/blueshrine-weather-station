import 'package:state_notifier/state_notifier.dart';

import '../../domain/entities/entities.dart';
import '../weather/weather.dart';
import './thematic_behavior.dart';

class ThemeProviderImpl extends StateNotifier<ThemeState> with LocatorMixin {
  ThemeProviderImpl() : super(ThemeState.initial());

  @override
  void update(Locator watch) {
    final WeatherEntity? weather = watch<WeatherState>().weather;
    if (weather != null) {
      final double temp = weather.temperature - 273.15;
      if (temp >= 20.0) {
        state = state.copyWith(appTheme: AppTheme.light);
      } else {
        state = state.copyWith(appTheme: AppTheme.dark);
      }
      super.update(watch);
    }
  }
}
