import 'package:flutter/material.dart';

class AppTheme {

  static const primaryBoxDecoration = BoxDecoration(
      gradient: AppTheme.primaryBarGradient
  );

  static const primaryBarGradient = LinearGradient(
      colors: [
        Color(0xFF09436c),
        Color(0xFF23b5d2),
      ]
  );
}