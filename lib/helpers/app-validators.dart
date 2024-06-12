import 'package:email_validator/email_validator.dart';

class AppValidators {

  /// Validateur : Format email
  static String? validateEmail(String? value) {
    // Si email pas valide
    if (!EmailValidator.validate(value!)){
      return "Le format de l'email n'est pas valide";
    }

    return null;
  }
}

