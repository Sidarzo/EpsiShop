import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class Product{
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final double rate;

  Product({required this.id,required this.title,required this.description,required this.price,required this.image,required this.category, required this.rate});

    String displayPriceInEuro(){
     return '$price €';
    }

  static get(String route) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview

    var url = Uri.parse(route);

    // Await the http get response, then decode the json-formatted response.
    try {
          var response = await http.get(url);
          if (response.statusCode == 200) {
            return jsonDecode(response.body);
          } else {
            throw ('Error :${response.statusCode}');
          }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Product>> getProducts() async {
    final List<dynamic> maps = await get('https://fakestoreapi.com/products');

    return List.generate(maps.length, (i) {
      return Product(id: maps[i]['id'],title: maps[i]['title'],description: maps[i]['description'],price: maps[i]['price'].toDouble(), image: maps[i]['image'],category: maps[i]['category'], rate: maps[i]['rating']['rate'].toDouble());
    });
  }

  RatingBar buildRatingBar(){
    return RatingBar.builder(
      initialRating: rate,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }

}

  




