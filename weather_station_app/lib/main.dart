import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import './layers/factories/http/http.dart';
import './layers/providers/weather/weather.dart';
import './layers/providers/temp_settings/temp_settings.dart';
import './layers/presentation/ui/pages/pages.dart';

import './layers/data/repositories/repositories.dart';
import './layers/data/usecases/usecases.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherRepositoryImpl>(
          create: (context) => WeatherRepositoryImpl(
            geolocationUsecase: GeolocationUsecaseImpl(
              httpClient: MakeHttpAdapter.call,
            ),
            meteorologyUsecase: MeteorologyUsecaseImpl(
              httpClient: MakeHttpAdapter.call,
            ),
          ),
        ),
        StateNotifierProvider<WeatherProviderImpl, WeatherState>(
          create: (context) => WeatherProviderImpl(),
        ),
        StateNotifierProvider<TempSettingsProviderImpl, TempSettingsState>(
          create: (context) => TempSettingsProviderImpl(),
        ),
      ],
      child: MaterialApp(
        home: const WeatherPage(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
