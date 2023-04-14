import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './layers/factories/http/http.dart';
import './layers/providers/weather/weather.dart';
import './layers/presentation/ui/pages/pages.dart';

import './layers/data/repositories/repositories.dart';
import './layers/data/usecases/usecases.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RemoteWeatherRepositoryImpl>(
          create: (context) => RemoteWeatherRepositoryImpl(
            geolocationUsecase: RemoteGeolocationUsecaseImpl(
              httpClient: MakeHttpAdapter.call,
            ),
            meteorologyUsecase: RemoteMeteorologyUsecaseImpl(
              httpClient: MakeHttpAdapter.call,
            ),
          ),
        ),
        ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider(
            repository: context.read<RemoteWeatherRepositoryImpl>(),
          ),
        )
      ],
      child: MaterialApp(
        home: const WeatherPage(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
