import 'package:flutter/material.dart';
import 'package:tp_twitter/footer.dart';
import 'package:tp_twitter/header.dart';
import 'package:tp_twitter/tweet-card.dart';

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
          Header(),
          Expanded(child:
          Column(
            children: [
              TweetCard(),
            ],
          )
          ),
          Footer()
        ],
      ),
    );
  }
}