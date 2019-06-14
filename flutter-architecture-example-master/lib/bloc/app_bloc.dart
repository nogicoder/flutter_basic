import 'dart:async';

import 'package:flutter_app/models/construction_site_model.dart';
import 'package:flutter_app/service/construction_site_service.dart';
import 'package:rxdart/subjects.dart';

class AppBloc {    
  AppBloc(){
    //_constructionSiteController.stream.listen(useConstructionSiteFactory);    
    _selConstructionSiteController.stream.listen(updateSelectedConstructionSites);
    getData();
  }  

  void getData() async{
    ConstructionSitesService t = new ConstructionSitesService();
    var g = await t.getConstructionSites();
    print("on vient de recup les elements....");
    _constructionSitesList.addAll(g);
    _constructionSites.add(_constructionSitesList);
  }

  ///List of all the Construciton sites loaded in the application
  final _constructionSitesList = new List<ConstructionSiteModel>();
  final _constructionSites = BehaviorSubject<List<ConstructionSiteModel>>(seedValue: []);
  Stream<List<ConstructionSiteModel>> get constructionSites => _constructionSites.stream;

  ///Selected Construction Sites that goes to the cart
  final _selConstructionSitesList = new List<ConstructionSiteModel>();
  final _selConstructionSites = BehaviorSubject<List<ConstructionSiteModel>>(seedValue: new List<ConstructionSiteModel>());
  final _selConstructionSitesCount = BehaviorSubject<int>(seedValue: 0);
  final _selConstructionSiteController = StreamController<ConstructionSiteModel>();

  Stream<int> get selConstructionSitesCount => _selConstructionSitesCount.stream;
  Sink<ConstructionSiteModel> get selConstructionSitesSink => _selConstructionSiteController.sink;
  Stream<List<ConstructionSiteModel>> get selConstructionSites => _selConstructionSites.stream;

  ///List that manges all the construction sites that the user is currently selecting for hit "cart"
  void updateSelectedConstructionSites(ConstructionSiteModel model){
    _selConstructionSitesList.add(model);
    _selConstructionSites.add(_selConstructionSitesList);
    _selConstructionSitesCount.add(_selConstructionSitesList.length);    
  }

  void dispose() {
    _constructionSites.close();
    _constructionSitesList.clear();

    _selConstructionSiteController.close();
    _selConstructionSitesCount.close();
    _selConstructionSitesList.clear();
  }
}