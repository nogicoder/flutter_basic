import 'package:uikit_bycn_example/models/component_model.dart';
import 'package:uikit_bycn_example/services/component_service.dart';
import 'package:rxdart/rxdart.dart';

class ComponentBloc {
  final _componentList = new List<ComponentModel>();
  final _components = BehaviorSubject<List<ComponentModel>>();
  Stream<List<ComponentModel>> get components => _components.stream;

  ComponentBloc() {
    getData();
  }

  void getData() {
    ComponentService componentService = new ComponentService();
    var g = componentService.getComponents();
    _componentList.addAll(g);
    _components.add(_componentList);
  }

  void dispose() {
    _components.close();
    _componentList.clear();
  }
}
