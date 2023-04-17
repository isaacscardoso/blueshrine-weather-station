import 'package:flutter/material.dart';

Future<String> navigateToPage(BuildContext context, dynamic page) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
