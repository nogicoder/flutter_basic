import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/cart_bloc.dart';
import 'package:flutter_app/providers/cart_provider.dart';
import 'cart_button.dart';

class AppBarActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);

    return new StreamBuilder<int>(
      stream: cartBloc.selConstructionSitesCount,
      initialData: 0,
      builder: (context, snapshot) => CartButton(
        itemCount: snapshot.data,
        onPressed: () {
          Navigator.of(context).pushNamed("cart");
        },
      ),
    );
  }
}