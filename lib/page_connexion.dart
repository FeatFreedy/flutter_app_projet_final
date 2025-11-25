import 'package:flutter/material.dart';
import 'gestion_utilisateurs.dart';
import 'page_produit.dart';

class PageConnexion extends StatefulWidget {
  const PageConnexion({super.key});

  @override
  State<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void connecter() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (GestionUtilisateur.verifierConnexion(email, password)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PageProduit()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Identifiants incorrects")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // LOGO
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 260,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  'CONNEXION',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: UnderlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot De Passe',
                border: UnderlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: connecter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'SE CONNECTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
