import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';
import '../model/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> cartProducts = context.watch<Cart>().getListProduct();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier Flutter Sales'),
      ),
      body:
        Container(
          padding: const EdgeInsets.all(8.0),
          child: 
            Column(
              children: [
                Text('Votre panier contient ${cartProducts.length} élément(s)', 
                style: Theme.of(context).textTheme.headline6
                ),
                 ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap:(){
                      context.go("/product/detail",extra: cartProducts[index]);
                    } ,
                    title: Text(cartProducts[index].title),
                    subtitle: Text(cartProducts[index].displayPriceInEuro()),
                    leading: Image.network(cartProducts[index].image,width: 80,height: 80,),
                    trailing: TextButton(child: const Text("Remove"),onPressed: (){
                      context.read<Cart>().remove(cartProducts[index]);
                    },),
                  )
              ),
                const Spacer(),
                Text('Votre panier total est de : ${context.read<Cart>().getTotalPrice()}',
                style: Theme.of(context).textTheme.headline6
                )
              ],
            ),
        )
    );
  }
}