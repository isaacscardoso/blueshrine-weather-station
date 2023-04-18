import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../utils/utils.dart';
import '../components/components.dart';

class WeatherData extends StatefulWidget {
  const WeatherData({super.key});

  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  late final WeatherProviderImpl _provider;

  @override
  void initState() {
    super.initState();
    _provider = context.read<WeatherProviderImpl>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WeatherState state = context.watch<WeatherState>();
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          CustomText(
            content: state.weather?.name,
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                content: TimeOfDay.fromDateTime(
                  state.weather!.lastUpdated,
                ).format(context),
                fontSize: 18.0,
              ),
              const SizedBox(width: 10.0),
              CustomText(
                content: '(${state.weather!.country})',
                fontSize: 18.0,
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText(
                content: TemperatureScale.of(
                  context,
                  temperature: state.weather!.temperature,
                ),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
              const SizedBox(width: 30.0),
              Column(
                children: <Widget>[
                  CustomText(
                    content: TemperatureScale.of(
                      context,
                      temperature: state.weather!.maximumTemperature,
                    ),
                    fontSize: 16.0,
                  ),
                  const SizedBox(height: 10.0),
                  CustomText(
                    content: TemperatureScale.of(
                      context,
                      temperature: state.weather!.minimunTemperature,
                    ),
                    fontSize: 16.0,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
