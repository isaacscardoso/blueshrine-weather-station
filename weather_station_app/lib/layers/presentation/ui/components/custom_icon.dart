import 'package:flutter/material.dart';

import '../../../factories/http/http.dart';

class CustomIcon extends StatelessWidget {
  final String icon;

  const CustomIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: MakeApiUrl.of(
        scheme: 'http',
        subdomain: 'www',
        path: 'img/wn/$icon@4x.png',
      ),
      width: 100,
      height: 100,
    );
  }
}
