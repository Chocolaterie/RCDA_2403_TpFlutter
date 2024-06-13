import 'package:flutter/material.dart';
import 'package:tp_twitter/message/tweet.dart';

class TweetCard extends StatelessWidget {

  Tweet tweet;

  TweetCard(this.tweet);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Container(height: 118, child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(tweet.profile, width: 76,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(tweet.author),
                          Text(tweet.displayPostDate())
                        ],),
                      Text(tweet.message)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Image.asset('images/reply.png', width: 24,),),
              IconButton(onPressed: () {}, icon: Image.asset('images/retweet.png', width: 24),),
              IconButton(onPressed: () {}, icon: Image.asset('images/favorite.png', width: 24),),
            ],),
        )
      ]),
    );
  }
}