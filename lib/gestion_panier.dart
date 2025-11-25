class GestionPanier {
  static List<Map<String, dynamic>> panier = [];

  static void ajouterProduit(Map<String, dynamic> produit) {
    panier.add(produit);
  }

  static void supprimerProduit(int index) {
    panier.removeAt(index);
  }
