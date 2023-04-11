import 'package:flutter/material.dart';

import '../utils/utils.dart';
import './pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: <Widget>[
          IconButton(
            onPressed: () => navigateToPage(context, const SettingsPage()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Search weather of some city.'),
        ),
      ),
    );
  }
}
