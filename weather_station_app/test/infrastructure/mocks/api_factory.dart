import 'package:faker/faker.dart';

class ApiFactory {
  static Map correctBody() {
    return {
      'name': faker.address.city(),
      'lat': faker.geo.latitude(),
      'lon': faker.geo.longitude(),
      'country': faker.address.country(),
      'state': faker.address.state(),
    };
  }
}
