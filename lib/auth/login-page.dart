import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';
import 'package:tp_twitter/helpers/app-validators.dart';

class LoginPage extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  /// Quand je clique sur le bouton du formulaire
  void onClickSubmit(){
    // Enclancher la validation
    // PS : Plus tard on aura un appel API donc Guard Clause
    // je return quand erreur
    if (!formKey.currentState!.validate()){
      return;
    }

    // TODO : Appel API pour le service connexion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Connexion"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "images/background_01.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(80),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      "images/sign_in_icon.png",
                      width: 126,
                    ),
                  ),
                  Text(
                    "Connexion",
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 26),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: AppValidators.validateEmail,
                      decoration: AppTheme.buildFormDecoration("Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      decoration: AppTheme.buildFormDecoration("Password"),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: AppTheme.paddingForm,
                    child: Row(
                      children: [
                        Switch(value: false, onChanged: (value) {}),
                        Text("Mémoriser mes informations",
                            style: TextStyle(color: Color(0xFFFFFFFF)))
                      ],
                    ),
                  ),
                  Padding(
                    padding: AppTheme.paddingForm,
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: onClickSubmit, child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text("Connexion"),
                            ))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
