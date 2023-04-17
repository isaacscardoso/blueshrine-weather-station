import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';

import './enums/enums.dart';

import './iweather_provider.dart';

part './weather_state.dart';

class WeatherProvider with ChangeNotifier implements IWeatherProvider {
  final IWeatherRepository repository;
  late WeatherState state;

  WeatherProvider({required this.repository}) {
    state = WeatherState.initial();
  }

  @override
  Future<void> initWeatherData() async {
    state = state.copyWith(status: WeatherStatus.loading);
    notifyListeners();
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final WeatherEntity weather = await repository.initWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      state = state.copyWith(status: WeatherStatus.loaded, weather: weather);
      notifyListeners();
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }

  @override
  Future<void> fetchWeatherData({required String location}) async {
    state = state.copyWith(status: WeatherStatus.loading);
    notifyListeners();
    try {
      final WeatherEntity weather = await repository.fetchWeather(location);
      state = state.copyWith(status: WeatherStatus.loaded, weather: weather);
      notifyListeners();
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }
}
