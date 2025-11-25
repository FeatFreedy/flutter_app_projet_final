import 'package:flutter/material.dart';

class PageProduit extends StatefulWidget {
  const PageProduit({super.key});

  @override
  State<PageProduit> createState() => _PageProduitState();
}

class _PageProduitState extends State<PageProduit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Page Produit")),
    );
  }
}
