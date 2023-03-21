import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';

class RemoteWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherEntity> fetchWeather(String city) async {
    throw UnimplementedError();
  }
}
