import 'dart:convert';

import 'package:flutter_app/models/cart_item_model.dart';
import 'package:flutter_app/models/construction_site_model.dart';

class Helpers {
  static createConstructionSiteFromJSON(String json) {
    Map<String, dynamic> decodedString = jsonDecode(json);
    return new ConstructionSiteModel.fromJson(decodedString);
  }

  static ConstructionSiteModel createConstructionSite(index) {
    return new ConstructionSiteModel(
      id: index,
      address: "1st NTMK",
      city: "HCN",
      state: "VN",
      zip: "084",
      title: "Site title $index",
      zones: 4,
      levels: 3,
      posts: 3,
      longitude: -71.11095,
      latitude: 42.35663,
      picture: "assets/img/pict$index.jpg",
      thumbnail: "assets/img/pict$index.jpg",
      tags: "site",
      description: "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet",
    );
  }

  static CartItemModel createCartItem(int index) {
    return new CartItemModel(1, Helpers.createConstructionSite(index));
  }
}
