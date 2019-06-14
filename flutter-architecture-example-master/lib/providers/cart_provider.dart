import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget {  
  CartProvider({
    Key key,
    CartBloc cartBloc,
    Widget child,
  }) :  _cartBloc = cartBloc ?? new CartBloc(),
        super(key: key, child: child);

  final CartBloc _cartBloc;

  static CartBloc of(BuildContext context){
    return ((context).inheritFromWidgetOfExactType(CartProvider) as CartProvider)._cartBloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}