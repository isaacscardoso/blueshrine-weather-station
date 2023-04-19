import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            ListTile(
              title: const Text('Escala de Temperatura'),
              subtitle: const Text('Celsius / Fahrenheit (default: Celsius)'),
              trailing: Switch(
                value: context.watch<TempSettingsState>().tempScale ==
                    TempScale.celsius,
                onChanged: (_) =>
                    context.read<TempSettingsProviderImpl>().toggleTempScale(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
