import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:geolocator/geolocator.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';

import '../enums/enums.dart';

part './weather_state.dart';

class WeatherProvider with ChangeNotifier {
  final IWeatherRepository repository;
  late WeatherState _state;

  WeatherProvider({required this.repository}) {
    _state = WeatherState.initial();
    initWeather();
  }

  Future initWeather() async {
    _state = _state.copyWith(status: WeatherStatus.loading);
    notifyListeners();
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final WeatherEntity weather = await repository.initWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      _state = _state.copyWith(status: WeatherStatus.loaded, weather: weather);
      print('State 1: $_state');
      notifyListeners();
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }

  Future<void> fetchWeather(String cityName) async {
    _state = _state.copyWith(status: WeatherStatus.loading);
    notifyListeners();
    try {
      final WeatherEntity weather = await repository.fetchWeather(cityName);
      _state = _state.copyWith(status: WeatherStatus.loaded, weather: weather);
      notifyListeners();
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }
}
