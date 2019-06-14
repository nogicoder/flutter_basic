import 'package:flutter_app/models/cart_item_model.dart';
import 'package:flutter_app/models/cart_model.dart';
import 'package:flutter_app/models/construction_site_model.dart';
import 'package:test/test.dart';

import '../helpers/construction_sites_and_cart.dart';

void main() {
  CartModel _cart;

  setUpAll(() {
    _cart = new CartModel();
    _cart.addItem(Helpers.createCartItem(1));
    _cart.addItem(Helpers.createCartItem(2));
    _cart.addItem(Helpers.createCartItem(3));
    _cart.addItem(Helpers.createCartItem(4));
    _cart.addItem(Helpers.createCartItem(5));

    expect(_cart.count(), 5);
  });

  test('number of items in the cart when adding one new item', () {
    ConstructionSiteModel _cs = Helpers.createConstructionSite(6);
    _cart.addItem(new CartItemModel(1, _cs));

    expect(_cart.count(), 6);
  });

  test('can add construction site to the cart', () {
    int index = 7;

    ConstructionSiteModel _cs = Helpers.createConstructionSite(index);
    _cart.addItem(new CartItemModel(1, _cs));

    ConstructionSiteModel _foundCs = _cart.getItem(_cs);
    expect(_foundCs.id, 7);
    expect(_foundCs.address, "1st NTMK");    
    expect(_foundCs.city, "HCN");
    expect(_foundCs.state, "VN");
    expect(_foundCs.zip, "084");
    expect(_foundCs.title, "Site title 7");
    expect(_foundCs.zones, 4);
    expect(_foundCs.levels, 3);
    expect(_foundCs.posts, 3);
    expect(_foundCs.longitude, -71.11095);
    expect(_foundCs.latitude, 42.35663);
    expect(_foundCs.thumbnail, "assets/img/pict7.jpg");
    expect(_foundCs.picture, "assets/img/pict7.jpg");
    expect(_foundCs.tags, "site");
    expect(_foundCs.description, "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet");    
  });
}
