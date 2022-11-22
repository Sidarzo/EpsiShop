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

  int getCount(){
    return _listProduct.length;
  }

}