import 'package:flutter/material.dart';
import 'gestion_utilisateurs.dart';
import 'gestion_panier.dart';
import 'page_paiement_confirme.dart';

class PagePaiement extends StatefulWidget {
  const PagePaiement({super.key});

  @override
  State<PagePaiement> createState() => _PagePaiementState();
}

class _PagePaiementState extends State<PagePaiement> {
  
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  void showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  bool validateExpiry() {
    String exp = expiryController.text.trim();

    if (exp.length != 5 || !exp.contains("/")) {
      showError("Format expiration invalide (MM/AA)");
      return false;
    }

    final split = exp.split("/");
    int? month = int.tryParse(split[0]);
    int? year = int.tryParse(split[1]);

    if (month == null || year == null || month < 1 || month > 12) {
      showError("Mois d’expiration invalide");
      return false;
    }

    final now = DateTime.now();
    int currentYear = now.year % 100;
    int currentMonth = now.month;

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      showError("La carte est expirée");
      return false;
    }

    return true;
  }

  bool validatePayment() {
    String card = cardNumberController.text.trim();
    String cvv = cvvController.text.trim();

    if (card.length != 16 || int.tryParse(card) == null) {
      showError("Numéro de carte invalide (16 chiffres)");
      return false;
    }

    if (!validateExpiry()) return false;

    if (cvv.length != 3 || int.tryParse(cvv) == null) {
      showError("CVV invalide (3 chiffres)");
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final user = GestionUtilisateur.utilisateurConnecte!;
    final adresse = user["adresse"];

    final sousTotal = GestionPanier.getTotal();
    final taxes = sousTotal * 0.13;
    final total = sousTotal + taxes;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PAIEMENT", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Adresse de livraison",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(adresse["rue"]),
                  Text(adresse["ville"]),
                  Text("${adresse["province"]} ${adresse["codePostal"]}"),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text("INFORMATIONS DE PAIEMENT",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

            const SizedBox(height: 12),

            TextField(
              controller: cardNameController,
              decoration: const InputDecoration(
                labelText: "Nom sur la carte",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: "Numéro de carte",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 16,
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryController,
                    decoration: const InputDecoration(
                      labelText: "Exp (MM/AA)",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    onChanged: (value) {
                      if (value.length == 2 && !value.contains("/")) {
                        expiryController.text = "$value/";
                        expiryController.selection = TextSelection.fromPosition(
                          TextPosition(offset: expiryController.text.length),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: cvvController,
                    decoration: const InputDecoration(
                      labelText: "CVV",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    obscureText: true,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(6),
                    color: Colors.grey.shade300,
                    child: const Text(
                      "Résumé de la commande",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 12),

                  rowItem("Sous-total", "\$${sousTotal.toStringAsFixed(2)}"),
                  rowItem("Expédition", "Gratuit"),
                  rowItem("Taxes (13%)", "\$${taxes.toStringAsFixed(2)}"),

                  const Divider(),

                  rowItem("Total", "\$${total.toStringAsFixed(2)}",
                      bold: true),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (validatePayment()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PagePaiementConfirme()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "CONFIRMER LE PAIEMENT",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowItem(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
          Text(value,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null)),
        ],
      ),
    );
  }
}
