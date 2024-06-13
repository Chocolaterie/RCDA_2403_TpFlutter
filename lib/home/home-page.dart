import 'package:flutter/material.dart';
import 'package:tp_twitter/footer.dart';
import 'package:tp_twitter/header.dart';
import 'package:tp_twitter/helpers/app-dialog-mgr.dart';
import 'package:tp_twitter/tweet-card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../message/tweet.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tweet> tweets = [];

  void onClickRefresh(BuildContext context) async {
    // Afficher la boite de chargement
    AppDialogMgr().showProgress(context, "Récupération des tweets");

    // Simuler 1 seconde de lag
    await Future.delayed(Duration(seconds: 2));

    // appel l'api
    var url = Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");
    var response = await http.get(url);

    // map la reponse en json
    var json = convert.jsonDecode(response.body);

    // la réponse en liste de tweet
    tweets = List<Tweet>.from(json.map((tweetJson) => Tweet.fromJson(tweetJson)).toList());

    // refresh la page
    setState(() {});

    // fermer la boite de chargement
    AppDialogMgr().closeProgress();
  }

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
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => onClickRefresh(context), child: Text("Refraichir"))),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: tweets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TweetCard(tweets[index]);
                      }),
                ),
              ],
            ),
          )),
          Footer()
        ],
      ),
    );
  }
}
