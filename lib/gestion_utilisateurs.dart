import 'dart:convert';
import 'package:flutter/services.dart';

class GestionUtilisateur {
  static List utilisateurs = [];
  static Map<String, dynamic>? utilisateurConnecte;

  static Future<void> chargerUtilisateurs() async {
    String data = await rootBundle.loadString('assets/data/utilisateurs.json');
    utilisateurs = jsonDecode(data);
  }

  static bool verifierConnexion(String email, String password) {
    for (var user in utilisateurs) {
      if (user["email"] == email && user["password"] == password) {
        utilisateurConnecte = user;
        return true;
      }
    }
    return false;
  }
}
