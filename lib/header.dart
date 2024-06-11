import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';

class HeaderButton extends StatelessWidget {
  String? label;
  String? imgPath;

  HeaderButton({this.label, this.imgPath}) {}

  /// Fonction qui retournera la version Text du bouton
  Widget makeTextButton(){
    return Text(
      this.label!,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    );
  }

  /// Fonction qui retournera la version IconButon du bouton
  Widget makeIconutton() {
    return IconButton(onPressed: () {}, icon: Image.asset(this.imgPath!, width: 26,));
  }

  @override
  Widget build(BuildContext context) {
    // Si l'image n'est pas null alors on affiche la version icon
    if (this.imgPath != null){
      return makeIconutton();
    }
    // par défaut la version texte
    return makeTextButton();
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppTheme.primaryBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderButton(imgPath: 'images/pencil.png'),
            HeaderButton(label : "Accueil"),
            HeaderButton(imgPath: 'images/search.png'),
          ],
        ),
      ),
    );
  }
}
