import 'package:flutter/material.dart';
import 'package:parpin/model/product.dart';
// TODO
// AJOUTER LE RATING (dispo dans l'api)
// SOUS FORME D'ETOILE
class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}\'s detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Hero(tag: product.id.toString(), 
              child: Image.network(product.image,scale: 6,)
            )
          ),
        
          Text(product.title, style: Theme.of(context).textTheme.headline6,),
          Text(product.description, style: Theme.of(context).textTheme.subtitle1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price.toString()),
              ElevatedButton(onPressed: (){}, child: Text('Ajouter'))
            ],
          )
       ],
      ),
      )
      
       
    );
  }
}