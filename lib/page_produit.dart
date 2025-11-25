import 'package:flutter/material.dart';
import 'gestion_panier.dart';
import 'page_panier.dart';

class PageProduit extends StatefulWidget {
  const PageProduit({super.key});

  @override
  State<PageProduit> createState() => _PageProduitState();
}

class _PageProduitState extends State<PageProduit> {

  final List<Map<String, dynamic>> produits = const [
    {
      "image": "assets/images/shoe1.jpg",
      "titre": "Nike Air Max 90",
      "prix": 180.00,
      "note": 4.5
    },
    {
      "image": "assets/images/shoe2.jpg",
      "titre": "Jordan 5 OG Grape",
      "prix": 270.00,
      "note": 4.8
    },
    {
      "image": "assets/images/shoe3.jpg",
      "titre": "Jordan 8 OG Aqua",
      "prix": 270.00,
      "note": 4.2
    },
    {
      "image": "assets/images/shoe4.jpg",
      "titre": "Nike Air Force 1 Low",
      "prix": 150.00,
      "note": 4.7
    },
    {
      "image": "assets/images/shoe5.jpg",
      "titre": "Jordan 1 OG Shattered",
      "prix": 235.00,
      "note": 4.9
    },
    {
      "image": "assets/images/shoe6.jpg",
      "titre": "Jordan 12 French Blue",
      "prix": 280.00,
      "note": 4.3
    },
    {
      "image": "assets/images/shoe7.jpg",
      "titre": "Asics Gel Kayano 14",
      "prix": 200.00,
      "note": 4.6
    },
    {
      "image": "assets/images/shoe8.jpg",
      "titre": "Nike Air Max TN Black",
      "prix": 235.00,
      "note": 4.9
    },
    {
      "image": "assets/images/shoe9.jpg",
      "titre": "Nike V2K Moto",
      "prix": 120.00,
      "note": 4.8
    },
    {
      "image": "assets/images/shoe10.jpg",
      "titre": "Jordan 4 Cave Stone",
      "prix": 280.00,
      "note": 4.4
    },
    {
      "image": "assets/images/shoe11.jpg",
      "titre": "Jordan 3 Rare Air",
      "prix": 270.00,
      "note": 4.5
    },
    {
      "image": "assets/images/shoe12.jpg",
      "titre": "Adidas Superstar II",
      "prix": 130.00,
      "note": 4.9
    },
  ];
final TextEditingController _ctrlRecherche = TextEditingController();
  List<Map<String, dynamic>> produitsFiltres = [];

  @override
  void initState() {
    super.initState();
    produitsFiltres = List.from(produits);

    _ctrlRecherche.addListener(() {
      filtrerProduits(_ctrlRecherche.text);
    });
  }

  void filtrerProduits(String query) {
    final texte = query.toLowerCase();

    setState(() {
      produitsFiltres = produits.where((p) {
        return p["titre"].toLowerCase().contains(texte)
            || p["prix"].toString().contains(texte);
      }).toList();
    });
  }

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
                children: [
                  const Icon(Icons.menu, size: 32),

                  Image.asset("assets/images/logo.png", height: 80),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PagePanier()),
                      );
                    },
                    child: Stack(
                      children: [
                        const Icon(Icons.shopping_cart, size: 28),

                        if (GestionPanier.panier.isNotEmpty)
                          Positioned(
                            right: 0,
                            top: -5,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "${GestionPanier.panier.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              TextField(
                controller: _ctrlRecherche,
                decoration: InputDecoration(
                  hintText: "Rechercher une chaussure...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Collection",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 2;

                    if (constraints.maxWidth > 1200) {
                      crossAxisCount = 4;
                    } else if (constraints.maxWidth > 800) {
                      crossAxisCount = 3;
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        childAspectRatio: 0.80,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: produitsFiltres.length,
                      itemBuilder: (context, index) {
                        final p = produitsFiltres[index];

                        return Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  p["image"],
                                  fit: BoxFit.contain,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                p["titre"],
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                "\$${p["prix"]}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  Text("${p["note"]}"),
                                ],
                              ),

                              const SizedBox(height: 10),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    GestionPanier.ajouterProduit(p);
                                    setState(() {});

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Ajouté au panier !")),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    "AJOUTER AU PANIER",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
