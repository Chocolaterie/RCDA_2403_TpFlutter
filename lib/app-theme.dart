import 'package:flutter/material.dart';

class AppTheme {

  static const paddingForm = const EdgeInsets.symmetric(vertical: 10);

  static const primaryBoxDecoration = BoxDecoration(
      gradient: AppTheme.primaryBarGradient
  );

  static const primaryBarGradient = LinearGradient(
      colors: [
        Color(0xFF09436c),
        Color(0xFF23b5d2),
      ]
  );

  static InputDecoration buildFormDecoration(String labelText){
    return InputDecoration(
      fillColor: Color(0xAAFFFFFF),
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      labelText: labelText,
    );
  }

}