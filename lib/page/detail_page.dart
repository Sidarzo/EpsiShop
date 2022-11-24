import 'package:flutter/material.dart';
import 'package:parpin/model/product.dart';
import 'package:provider/provider.dart';

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
              ElevatedButton(onPressed: (){}, child: const Text('Ajouter'))
            ],
          ),
          Row(
            children: [
              product.buildRatingBar(),
            ],
          )
       ],
      ),
      )
      
       
    );
  }
}