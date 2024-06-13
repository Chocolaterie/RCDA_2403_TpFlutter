import 'package:flutter/material.dart';
import 'package:tp_twitter/auth/login-page.dart';
import 'package:tp_twitter/home/home-page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Twitter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/show',
      routes: {
        '/' : (context) => LoginPage(),
        '/show' : (context) => MyHomePage()
      },
    );
  }
}