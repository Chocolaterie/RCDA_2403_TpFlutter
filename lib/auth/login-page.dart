import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tp_twitter/app-theme.dart';
import 'package:tp_twitter/auth/user-context-mgr.dart';
import 'package:tp_twitter/helpers/app-dialog-mgr.dart';
import 'package:tp_twitter/helpers/app-validators.dart';

class LoginPage extends StatelessWidget {

  var _emailController = TextEditingController(text: "isaac@gmail.com");
  var _passwordController = TextEditingController(text: "123456");
  var formKey = GlobalKey<FormState>();

  /// Quand je clique sur le bouton du formulaire
  void onClickSubmit(BuildContext context) async {
    // Enclancher la validation
    // PS : Plus tard on aura un appel API donc Guard Clause
    // je return quand erreur
    if (!formKey.currentState!.validate()){
      return;
    }

    // Appel API pour le service connexion
    final url = Uri.parse('http://127.0.0.1:3000/auth');
    final headers = {"Content-Type": "application/json"};
    final body = convert.json.encode({
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    // Appel POST de l'auth
    final response = await http.post(url, headers: headers, body: body);

    // Convertir le body de la réponse http en json
    var json = convert.jsonDecode(response.body);

    // Normalement : Code , Message , Data
    // Erreur : Afficher la popup d'erreur
    if (json ['code'] != "203"){
      AppDialogMgr().showErrorAlert(context, json['message'] as String);
      return;
    }

    // Pas d'erreur
    // -- stocker le token
    var token = json['data'] as String;
    UserContextMgr().refreshToken(token);

    // -- changer de page
    Navigator.pushNamed(context, "/show");
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
                      controller: _emailController,
                      validator: AppValidators.validateEmail,
                      decoration: AppTheme.buildFormDecoration("Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: _passwordController,
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
                            onPressed: () => onClickSubmit(context), child: Padding(
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
