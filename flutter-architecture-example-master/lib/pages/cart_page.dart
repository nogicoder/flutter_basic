import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/cart_bloc.dart';
import 'package:flutter_app/models/cart_item_model.dart';
import 'package:flutter_app/providers/cart_provider.dart';
import 'package:flutter_app/widgets/appbar_action_button.dart';
import 'package:flutter_app/widgets/cart_page/cart_page_counter.dart';
import 'package:flutter_app/widgets/cart_page/cart_page_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartBloc cartProvider = CartProvider.of(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cart"),
        actions: <Widget>[
          new AppBarActionButton(),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: new StreamBuilder<List<CartItemModel>>(
              stream: cartProvider.selConstructionSites,
              initialData: new List<CartItemModel>(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return new CartPageItem(
                        snapshot.data[index].constructionSite.title,
                        snapshot.data[index].constructionSite.address,
                        snapshot.data[index].count);
                  },
                );
              },
            ),
          ),
          new Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            height: 40.0,
            child: Container(
              color: const Color(0xFFFFFFFF),
              child: StreamBuilder<int>(
                stream: cartProvider.selConstructionSitesCount,
                builder: (context, snapshot){                  
                  return new CartPageCounter(snapshot.data);
                })                
            ),
          ),
        ],
      ),
      // body: new Container(
      //   child: new Center(
      //     child: new StreamBuilder<List<CartItemModel>>(
      //       stream: cartProvider.selConstructionSites,
      //       initialData: new List<CartItemModel>(),
      //       builder: (context, snapshot) {
      //         return ListView.builder(
      //           itemCount: snapshot.data.length,
      //           itemBuilder: (context, index) {
      //             return new CartPageItem(snapshot.data[index].constructionSite.title, snapshot.data[index].constructionSite.address, snapshot.data[index].count);
      //           },
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
