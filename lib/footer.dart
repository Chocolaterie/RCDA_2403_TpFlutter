import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  String label;

  FooterButton(this.label) { }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(this.label, textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF646464)),));
  }
}

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(children: [
          FooterButton("Fil"),
          FooterButton("Notification"),
          FooterButton("Messages"),
          FooterButton("Moi"),
        ],),
      ),
    );
  }
}