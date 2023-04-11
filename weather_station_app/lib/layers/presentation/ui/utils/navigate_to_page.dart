import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, dynamic page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
