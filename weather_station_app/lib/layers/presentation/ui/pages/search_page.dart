import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_station_app/layers/providers/weather/weather.dart';

import '../../validators/validators.dart';
import '../utils/utils.dart';
import './pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _formularyKey = GlobalKey<FormState>();
  late String? _cityName;

  toSubmitFormulary() async {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
    if (_formularyKey.currentState!.validate()) {
      _formularyKey.currentState!.save();
      context.read<WeatherProvider>().fetchWeather(_cityName!);
      Navigator.of(context).pop(_cityName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Cities'),
        actions: <Widget>[
          IconButton(
            onPressed: () => navigateToPage(context, const SettingsPage()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 18.0, right: 18.0),
          child: Form(
            key: _formularyKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  autofocus: false,
                  style: const TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    labelText: 'Enter location',
                    hintText: 'city name...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) => SearchFormularyValidator.verify(value),
                  onSaved: (value) => _cityName = value?.trim(),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () => toSubmitFormulary(),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  child: const Text('BUSCAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
