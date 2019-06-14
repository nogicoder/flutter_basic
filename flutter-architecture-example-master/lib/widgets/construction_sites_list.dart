import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/app_bloc.dart';
import 'package:flutter_app/bloc/cart_bloc.dart';
import 'package:flutter_app/models/cart_item_model.dart';
import 'package:flutter_app/models/construction_site_model.dart';
import 'package:flutter_app/providers/app_provider.dart';
import 'package:flutter_app/providers/cart_provider.dart';

class ConstructionSitesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppBloc appProvider = AppProvider.of(context);
    CartBloc cartBloc = CartProvider.of(context);
  
    return new StreamBuilder<List<ConstructionSiteModel>>(
      stream: appProvider.constructionSites,
      initialData: new List<ConstructionSiteModel>(),
      builder: (context, snapshot) {
        if (snapshot.data.isEmpty)
          return Center(child: CircularProgressIndicator());

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                cartBloc.updateCart(new CartItemModel(1, snapshot.data[index]));
              },
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[                                
                  new AspectRatio(
                    aspectRatio: 360 / 220,
                    child: Image.network(
                      'https://wapitest.azurewebsites.net/assets/img/pict${snapshot.data[index].id}.jpg', 
                      fit: BoxFit.fill,
                    ),                    
                  ),                  
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Text(
                      snapshot.data[index].title,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Text(snapshot.data[index].description),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
