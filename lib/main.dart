import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class HeaderButton extends StatelessWidget {
  String label;

  HeaderButton(this.label) { }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(this.label, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("TP Twitter"),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xFF58B0F0)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                HeaderButton("Nouveau"),
                HeaderButton("Accueil"),
                HeaderButton("Recherché"),
              ],),
            ),
          )
        ],
      ),
    );
  }
}