import 'package:faker/faker.dart';

class ApiFactory {
  static List<Map<String, dynamic>> correctBody() {
    return [
      {
        'name': faker.address.city(),
        'lat': faker.geo.latitude(),
        'lon': faker.geo.longitude(),
        'country': faker.address.country(),
        'state': faker.address.state(),
      }
    ];
  }
}
