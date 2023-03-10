import '../../domain/usecases/usecases.dart';

class RemoteMeteorologyParameters {
  final String cityName;

  RemoteMeteorologyParameters({required this.cityName});

  factory RemoteMeteorologyParameters.fromDomain(
      MeteorologyParameters parameters) {
    return RemoteMeteorologyParameters(cityName: parameters.cityName);
  }

  Map<String, String> toJson() => {'cityName': cityName};
}
