import 'package:flutter/material.dart';

class PagePaiementConfirme extends StatelessWidget {
  const PagePaiementConfirme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 90,
                color: Colors.green.shade700,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Paiement confirmé",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Votre commande a été traitée\navec succès.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
