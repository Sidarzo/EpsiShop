import 'package:flutter/material.dart';
import 'package:parpin/model/product.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/cart.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListProduct'),
        actions: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              IconButton(onPressed: ()=> context.go('/cartpage'), icon: const Icon(Icons.shopping_cart)),
              Positioned(
                right: 8,
                top: 8,
                child: Container(width: 18,height: 18,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("${context.watch<Cart>().getCount()}",style: TextStyle(color: Colors.white),)
                    )
                ),
              ),
            ],
          )
        ],
      ),
      body: buildListProduct(),
    );
  }

  buildListProduct() {
    return FutureBuilder<List<Product>>(
        future: Product.getProducts(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return 
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return buildRow(snapshot.data![i]);   
                }
            );
          } else {
            return Column(
              children: const [
                Center(child: CircularProgressIndicator(),)]);
          }
        }
      );
  }
  buildRow(Product product) {
    return ListTile(
      leading: Hero(tag: product.id.toString(),child: Image.network(product.image, scale: 15.0,)),
      title: Text(product.title),
      subtitle: Text(product.price.toString(), style: Theme.of(context).textTheme.headline6,),
      trailing: IconButton(onPressed: (){
        context.read<Cart>().add(product);
      }, icon: const Icon(Icons.add),),
      onTap: () => context.go('/product/detail',extra: product),
    );
  }

}