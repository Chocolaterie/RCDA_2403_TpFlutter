import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class AppDialogMgr {

  // =========================================== //
  // * SINGLETON
  // =========================================== //

  // Instance statique de la classe AppDialogMgr
  static final AppDialogMgr _instance = AppDialogMgr._internal();

  // Constructeur privé pour empêcher la création d'instances à l'extérieur de la classe
  AppDialogMgr._internal();

  // Méthode statique qui renvoie l'instance unique de AppDialogMgr
  factory AppDialogMgr() {
    return _instance;
  }
  // =========================================== //
  // * SINGLETON
  // =========================================== //

  ProgressDialog? pgDl;

  /// Afficher une chargement
  void showProgress(BuildContext context, String message) {
    ///= Create progress dialog
    pgDl = ProgressDialog(context: context);

    // Display progress
    pgDl!.show(
        msg: message,
        progressBgColor: Colors.transparent,
        elevation: 10.0,
        barrierColor: Color(0x77000000));
  }

  /// Fermer le chargement
  void closeProgress() {
    pgDl!.close();
  }

  /// Afficher popup d'erreur
  void showErrorAlert(BuildContext context, String message){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erreur'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}