import 'package:flutter/material.dart';
import 'gestion_panier.dart';

class PagePanier extends StatefulWidget {
  const PagePanier({super.key});

  @override
  State<PagePanier> createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {
  @override
  Widget build(BuildContext context) {
    final panier = GestionPanier.panier;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Panier"),
      ),
      body: panier.isEmpty
          ? const Center(child: Text("Votre panier est vide."))
          : const Center(child: Text("Panier détecté")),
    );
  }
}
