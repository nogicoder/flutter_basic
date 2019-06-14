import 'dart:async';
import 'package:flutter_app/models/construction_site_model.dart';

// class TestCS extends Mock implements ConstructionSitesService {
//   @override
//   List<ConstructionSiteModel> _sampleCS;

//   @override
//   Future<List<ConstructionSiteModel>> getConstructionSites() {
//     // TODO: implement getConstructionSites
//   } 

// }

class ConstructionSitesService{
  ConstructionSitesService(){

    ConstructionSiteModel cs01 = new ConstructionSiteModel(
      id: 1,
      address: "1st NTMK",
      city: "HCN",
      state: "VN",
      zip: "084",
      title: "Site title 1",
      zones: 4,
      levels: 3,
      posts: 3,
      longitude: -71.11095,
      latitude: 42.35663,
      picture: "assets/img/pict1.jpg",
      thumbnail: "assets/img/pict1.jpg",
      tags: "site",
      description: "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet",
    );

    ConstructionSiteModel cs02 = new ConstructionSiteModel(
      id: 2,
      address: "1st NTMK",
      city: "HCN",
      state: "VN",
      zip: "084",
      title: "Site title 2",
      zones: 4,
      levels: 3,
      posts: 3,
      longitude: -71.11095,
      latitude: 42.35663,
      picture: "assets/img/pict2.jpg",
      thumbnail: "assets/img/pict2.jpg",
      tags: "site",
      description: "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet",
    );

    ConstructionSiteModel cs03 = new ConstructionSiteModel(
      id: 3,
      address: "1st NTMK",
      city: "HCN",
      state: "VN",
      zip: "084",
      title: "Site title 3",
      zones: 4,
      levels: 3,
      posts: 3,
      longitude: -71.11095,
      latitude: 42.35663,
      picture: "assets/img/pict3.jpg",
      thumbnail: "assets/img/pict3.jpg",
      tags: "site",
      description: "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet",
    );

    ConstructionSiteModel cs04 = new ConstructionSiteModel(
      id: 4,
      address: "1st NTMK",
      city: "HCN",
      state: "VN",
      zip: "084",
      title: "Site title 4",
      zones: 4,
      levels: 3,
      posts: 3,
      longitude: -71.11095,
      latitude: 42.35663,
      picture: "assets/img/pict4.jpg",
      thumbnail: "assets/img/pict4.jpg",
      tags: "site",
      description: "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet",
    );

    ConstructionSiteModel cs05 = new ConstructionSiteModel(
      id: 5,
      address: "1st NTMK",
      city: "HCN",
      state: "VN",
      zip: "084",
      title: "Site title 5",
      zones: 4,
      levels: 3,
      posts: 3,
      longitude: -71.11095,
      latitude: 42.35663,
      picture: "assets/img/pict5.jpg",
      thumbnail: "assets/img/pict5.jpg",
      tags: "site",
      description: "Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet...Lorem ipsum dolor sit amet",
    );

    _sampleCS.add(cs01);
    _sampleCS.add(cs02);
    _sampleCS.add(cs03);
    _sampleCS.add(cs04);
    _sampleCS.add(cs05);
  }

  List<ConstructionSiteModel> _sampleCS = new List<ConstructionSiteModel>();

  Future<List<ConstructionSiteModel>> getConstructionSites() async {
    await Future.delayed(new Duration(seconds: 1));
    return _sampleCS;
  }
}