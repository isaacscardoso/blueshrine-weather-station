import 'package:faker/faker.dart';

import 'package:weather_station_app/domain/usecases/usecases.dart';

class ParametersFactory {
  static MeteorologyParameters connect() {
    return MeteorologyParameters(cityName: faker.address.city());
  }
}
