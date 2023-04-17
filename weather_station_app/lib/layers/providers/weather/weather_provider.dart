import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';

import '../enums/enums.dart';

import './iweather_provider.dart';

part './weather_state.dart';

class WeatherProvider with ChangeNotifier implements IWeatherProvider {
  final IWeatherRepository repository;
  late WeatherState _state;

  WeatherProvider({required this.repository}) {
    _state = WeatherState.initial();
  }

  @override
  Future<void> initWeatherData() async {
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

  @override
  Future<void> fetchWeatherData({required String location}) async {
    _state = _state.copyWith(status: WeatherStatus.loading);
    notifyListeners();
    try {
      final WeatherEntity weather = await repository.fetchWeather(location);
      _state = _state.copyWith(status: WeatherStatus.loaded, weather: weather);
      print('City Founded: $weather');
      notifyListeners();
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }
}
