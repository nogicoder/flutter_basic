import 'package:flutter_app/models/cart_item_model.dart';
import 'package:flutter_app/models/construction_site_model.dart';

class CartModel {
  CartModel() {
    this._items = new List<CartItemModel>();
  }

  ///Get all items in the list
  List<CartItemModel> _items;

  ///Allows to get an specific item in th list
  ConstructionSiteModel getItem(ConstructionSiteModel cartItem){
    ConstructionSiteModel _selItem = _items.firstWhere((foundCartItem) => foundCartItem.constructionSite.id == cartItem.id).constructionSite;
    return _selItem;
  }

  List<CartItemModel> getAllItems(){
    return this._items;
  }

  ///Update the cart 
  void addItem(CartItemModel model){
    //find if the model already exists in the cart
    try
    {
      CartItemModel b = this._items.firstWhere((obj) => obj.constructionSite == model.constructionSite);
      this._items[this._items.indexOf(b)].increment();
    }
    catch(IterableElementError){
      print("no model found, add a new one");
      this._items.add(model);
    }
  }

  void removeItem(CartItemModel model){
    if(this._items.contains(model))
      this._items.remove(model);
    else
      throw new Exception("Cart does not contains this element");
  }

  ///Allows to get the total number of a specific item
  int itemCount(CartItemModel cartItem){
    //CartItemModel _selItem = items.firstWhere((foundCartItem) => foundCartItem.constructionSite.id == cartItem.constructionSite.id);
    return this._items.length;    
  }

  ///Allows to get the total number of items in the cart
  int count(){
    //CartItemModel _selItem = items.firstWhere((foundCartItem) => foundCartItem.constructionSite.id == cartItem.constructionSite.id);
    // return this._items.length;
    return _items.fold(0, (sum, el) => sum + el.count);
  }
}