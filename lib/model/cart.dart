import 'package:flutter/cupertino.dart';

import 'product.dart';

class Cart extends ChangeNotifier{
  final List<Product> _listProduct = [];


  void add(Product product){
    _listProduct.add(product);
    notifyListeners();
  }
  void remove(Product product){
    _listProduct.remove(product);
    notifyListeners();
  }

  List<Product> getListProduct(){
    return _listProduct;
  }

  int getCount(){
    return _listProduct.length;
  }

  double getTotalPrice(){
    double totalPrice = 0;

    for (var product in _listProduct) {
      totalPrice += product.price;
    }

    return totalPrice;
  }


}