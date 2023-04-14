part of './weather_provider.dart';

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherEntity? weather;

  const WeatherState({required this.status, this.weather});

  WeatherState copyWith({WeatherStatus? status, WeatherEntity? weather}) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object?> get props => [status, weather];
}
