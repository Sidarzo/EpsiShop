import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// TODO
// FAIRE LA VUE 
// Pouvoir : Supprimer, Afficher le produit, Afficher le prix total, Nombre d'élément dans le panier
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier Flutter Sales'),
      ),
      body: Center(
      child: 
        Container(
          padding: const EdgeInsets.all(8.0),
          child: 
            Column(
              children: [
                Text('Votre panier contient 0 élément(s)', 
                style: Theme.of(context).textTheme.headline6
                ),
                ListTile(
                  // leading: Image.network(""),
                  title: Text('Product'),
                  subtitle: Text('SubTitle'),
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.delete),
                  ),
                    // Image.network('https://via.placeholder.com/60'),
                ),
                Spacer(),
                Text('Votre panier total est de : 333.0',
                style: Theme.of(context).textTheme.headline6
                )
              ],
            ),
        )
      ),
    );
  }
}



