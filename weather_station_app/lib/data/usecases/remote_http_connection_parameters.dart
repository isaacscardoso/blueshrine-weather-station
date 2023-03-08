import '../../domain/usecases/usecases.dart';

class RemoteHttpConnectionParameters {
  final String cityName;

  RemoteHttpConnectionParameters({required this.cityName});

  factory RemoteHttpConnectionParameters.fromDomain(
      HttpConnectionParameters parameters) {
    return RemoteHttpConnectionParameters(cityName: parameters.cityName);
  }

  Map<String, String> toJson() => {'name': cityName};
}
