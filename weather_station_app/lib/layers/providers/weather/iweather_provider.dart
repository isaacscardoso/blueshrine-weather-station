abstract class IWeatherProvider {
  Future<void> initWeatherData();

  Future<void> fetchWeatherData({required String location});
}
