import 'dart:async';

import 'package:flutter_app/models/cart_model.dart';
import 'package:flutter_app/models/cart_item_model.dart';
import 'package:rxdart/subjects.dart';

class CartBloc {
  CartBloc(){    
    _cartConstructionSiteController.stream.listen(updateCart);
  }

  final CartModel _cartModel = new CartModel();

  final _cartConstructionSitesCount = BehaviorSubject<int>(seedValue: 0);
  final _cartConstructionSiteController = StreamController<CartItemModel>();

  final _selConstructionSites = BehaviorSubject<List<CartItemModel>>(seedValue: []);
  Stream<List<CartItemModel>> get selConstructionSites => _selConstructionSites.stream;

  Stream<int> get selConstructionSitesCount => _cartConstructionSitesCount.stream;

  void updateCart(CartItemModel model){
    _cartModel.addItem(model);
    _selConstructionSites.add(_cartModel.getAllItems());
    _cartConstructionSitesCount.add(_cartModel.count());
  }

  void dispose() {
    _cartConstructionSiteController.close();
  }
}