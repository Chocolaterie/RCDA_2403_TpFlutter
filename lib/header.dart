import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  String label;

  HeaderButton(this.label) { }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(this.label, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),));
  }
}

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF58B0F0)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(children: [
          HeaderButton("Nouveau"),
          HeaderButton("Accueil"),
          HeaderButton("Recherché"),
        ],),
      ),
    );
  }
}