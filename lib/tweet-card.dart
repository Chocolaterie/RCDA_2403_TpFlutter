import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Container(height: 118, child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network("https://avatar.iran.liara.run/public", width: 76,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("chocolatine@gmail.com"),
                          Text("50s")
                        ],),
                      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
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