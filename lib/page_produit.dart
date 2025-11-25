import 'package:flutter/material.dart';

class PageProduit extends StatefulWidget {
  const PageProduit({super.key});

  @override
  State<PageProduit> createState() => _PageProduitState();
}

class _PageProduitState extends State<PageProduit> {

  final List<Map<String, dynamic>> produits = const [
    {"image": "assets/images/shoe1.jpg", "titre": "Nike Air Max 90", "prix": 180.00, "note": 4.5},
    {"image": "assets/images/shoe2.jpg", "titre": "Jordan 5 OG Grape", "prix": 270.00, "note": 4.8},
    {"image": "assets/images/shoe3.jpg", "titre": "Jordan 8 OG Aqua", "prix": 270.00, "note": 4.2},
    {"image": "assets/images/shoe4.jpg", "titre": "Nike Air Force 1 Low", "prix": 150.00, "note": 4.7},
    {"image": "assets/images/shoe5.jpg", "titre": "Jordan 1 OG Shattered", "prix": 235.00, "note": 4.9},
    {"image": "assets/images/shoe6.jpg", "titre": "Jordan 12 French Blue", "prix": 280.00, "note": 4.3},
    {"image": "assets/images/shoe7.jpg", "titre": "Asics Gel Kayano 14", "prix": 200.00, "note": 4.6},
    {"image": "assets/images/shoe8.jpg", "titre": "Nike Air Max TN Black", "prix": 235.00, "note": 4.9},
    {"image": "assets/images/shoe9.jpg", "titre": "Nike V2K Moto", "prix": 120.00, "note": 4.8},
    {"image": "assets/images/shoe10.jpg", "titre": "Jordan 4 Cave Stone", "prix": 280.00, "note": 4.4},
    {"image": "assets/images/shoe11.jpg", "titre": "Jordan 3 Rare Air", "prix": 270.00, "note": 4.5},
    {"image": "assets/images/shoe12.jpg", "titre": "Adidas Superstar II", "prix": 130.00, "note": 4.9},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.menu, size: 32),
                  FlutterLogo(size: 40),
                  Icon(Icons.shopping_cart, size: 28),
                ],
              ),

              SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher une chaussure...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Collection",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}