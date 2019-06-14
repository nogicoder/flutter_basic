import 'package:flutter_app/models/construction_site_model.dart';

class CartItemModel{
  int _count;
  final ConstructionSiteModel _constructionSite;
  
  CartItemModel(this._count, this._constructionSite);

  ConstructionSiteModel get constructionSite => _constructionSite;

  int get count => this._count;

  void increment(){
    this._count++;
  }

  void decrement(){        
    this._count--;
  }
}