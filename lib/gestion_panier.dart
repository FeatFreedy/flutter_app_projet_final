class GestionPanier {
  static List<Map<String, dynamic>> panier = [];

  static void ajouterProduit(Map<String, dynamic> produit) {
    panier.add(produit);
  }

  static void supprimerProduit(int index) {
    panier.removeAt(index);
  }

  static double getTotal() {
    double total = 0;

    for (var item in panier) {
      total += item["prix"];
    }

    return total;
  }
