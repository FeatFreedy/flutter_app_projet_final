import 'package:flutter/material.dart';

class PagePanier extends StatefulWidget {
  const PagePanier({super.key});

  @override
  State<PagePanier> createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mon Panier"),
      ),
      body: const Center(
        child: Text("Chargement du panier..."),
      ),
    );
  }
}

