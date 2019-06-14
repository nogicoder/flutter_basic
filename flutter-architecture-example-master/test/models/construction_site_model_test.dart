import 'package:flutter_app/models/cart_item_model.dart';
import 'package:flutter_app/models/cart_model.dart';
import 'package:flutter_app/models/construction_site_model.dart';
import '../helpers/construction_sites_and_cart.dart';
import 'package:test/test.dart';

void main() {
  test('make a construction site from JSON', () {
    String json = """
      {
        "id":1,
        "address":"1st NTMK",
        "city":"HCN",
        "state":"VN",
        "zip":"084",
        "title":"Site title 1",
        "zones":4,
        "levels":3,
        "posts":3,
        "longitude":-71.11095,
        "latitude":42.35663,
        "picture":"assets/img/pict1.jpg",
        "thumbnail":"assets/img/pict1.jpg",
        "tags":"site",
        "description":"Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet"
      }     
      """;
    ConstructionSiteModel _cs = Helpers.createConstructionSiteFromJSON(json);
    expect(_cs.id, 1);
    expect(_cs.address, "1st NTMK");    
    expect(_cs.city, "HCN");
    expect(_cs.state, "VN");
    expect(_cs.zip, "084");
    expect(_cs.title, "Site title 1");
    expect(_cs.zones, 4);
    expect(_cs.levels, 3);
    expect(_cs.posts, 3);
    expect(_cs.longitude, -71.11095);
    expect(_cs.latitude, 42.35663);
    expect(_cs.thumbnail, "assets/img/pict1.jpg");
    expect(_cs.picture, "assets/img/pict1.jpg");
    expect(_cs.tags, "site");
    expect(_cs.description, "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet");    
  });

  test('get a json object from a consturction site', () {
    ConstructionSiteModel _cs = Helpers.createConstructionSite(1);
    Map<String, dynamic> json = _cs.toJson();

    expect(15, json.entries.length);
  });

  test('make a construction site and verify its data', (){
    ConstructionSiteModel _cs = Helpers.createConstructionSite(1);

    expect(_cs.id, 1);
    expect(_cs.address, "1st NTMK");    
    expect(_cs.city, "HCN");
    expect(_cs.state, "VN");
    expect(_cs.zip, "084");
    expect(_cs.title, "Site title 1");
    expect(_cs.zones, 4);
    expect(_cs.levels, 3);
    expect(_cs.posts, 3);
    expect(_cs.longitude, -71.11095);
    expect(_cs.latitude, 42.35663);
    expect(_cs.thumbnail, "assets/img/pict1.jpg");
    expect(_cs.picture, "assets/img/pict1.jpg");
    expect(_cs.tags, "site");
    expect(_cs.description, "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet");    
  });
}