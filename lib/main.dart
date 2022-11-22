import 'package:flutter/material.dart';
import 'package:parpin/model/product.dart';
import 'package:provider/provider.dart';
import '/page/carte_page.dart';
import '/page/list_product.dart';
import '/page/detail_page.dart';

import 'package:go_router/go_router.dart';

import 'model/cart.dart';


void main() {
  runApp(
    ChangeNotifierProvider<Cart>(create: (context) => Cart(), child: EpsiShop()));
}


class EpsiShop extends StatelessWidget {
   EpsiShop({Key? key}) : super(key: key);
  final _router = GoRouter(
      routes: [
        GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) => ListProduct(),

          routes: [
            GoRoute(
              path: 'cartpage', 
              builder: (BuildContext context, GoRouterState state) => CartPage(),
              
            ),
            GoRoute(
             path: 'product/detail',
             builder: (BuildContext context, GoRouterState state) {
               return DetailPage(product : state.extra as Product);
             },
            )
          ]

        ),
      ]
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Epsi Shop",
      theme: ThemeData(
        primaryColor: Colors.amber
      ),
      routerConfig: _router,
    );
  }
}