import 'package:flutter/material.dart';
import 'page_connexion.dart';
import 'gestion_utilisateurs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GestionUtilisateur.chargerUtilisateurs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageConnexion(),
    );
  }
}
