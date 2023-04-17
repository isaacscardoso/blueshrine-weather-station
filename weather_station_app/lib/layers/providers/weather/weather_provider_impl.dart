import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/repositories/repositories.dart';
import '../../domain/entities/entities.dart';

import './enums/enums.dart';

import './iweather_provider.dart';

part './weather_state.dart';

class WeatherProviderImpl extends StateNotifier<WeatherState> with LocatorMixin implements IWeatherProvider {
  WeatherProviderImpl() : super(WeatherState.initial());

  @override
  Future<void> initWeatherData() async {
    state = state.copyWith(status: WeatherStatus.loading);
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final WeatherEntity weather = await read<WeatherRepositoryImpl>().initWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      state = state.copyWith(status: WeatherStatus.loaded, weather: weather);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> fetchWeatherData({required String location}) async {
    state = state.copyWith(status: WeatherStatus.loading);
    try {
      final WeatherEntity weather = await read<WeatherRepositoryImpl>().fetchWeather(location);
      state = state.copyWith(status: WeatherStatus.loaded, weather: weather);
    } catch (error) {
      rethrow;
    }
  }
}
