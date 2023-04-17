part of './weather_provider_impl.dart';

class WeatherState extends Equatable {
  final WeatherStatus status;
  final WeatherEntity? weather;

  const WeatherState({required this.status, this.weather});

  factory WeatherState.initial() {
    return const WeatherState(status: WeatherStatus.initial);
  }

  WeatherState copyWith({WeatherStatus? status, WeatherEntity? weather}) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object?> get props => [status, weather];
}
