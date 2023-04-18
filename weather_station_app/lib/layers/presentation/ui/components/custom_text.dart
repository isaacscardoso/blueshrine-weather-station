import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? content;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;

  const CustomText({
    super.key,
    this.content,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content ?? '',
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
