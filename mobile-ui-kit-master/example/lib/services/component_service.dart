import 'package:uikit_bycn_example/models/component_model.dart';
import 'package:uikit_bycn_example/models/icons.dart';
import 'package:uikit_bycn_example/routes.dart';

class ComponentService {
  List<ComponentModel> models = new List<ComponentModel>();

  ComponentService() {
    ComponentModel button = new ComponentModel(
      title: "Buttons",
      subtitle: "Flat, Outline, Text, Toggle, Hub",
      icon: GalleryIcons.generic_buttons,
      routeName: RouteName.BUTTON_ROUTE,
    );

    ComponentModel selectionControl = new ComponentModel(
      title: "Selection Controls",
      subtitle: "Radio, Checkbox, Switch",
      icon: GalleryIcons.check_box,
      routeName: RouteName.SELECTION_CONTROL_ROUTE,
    );

    ComponentModel slider = new ComponentModel(
      title: "Slider",
      subtitle: "...",
      icon: GalleryIcons.sliders,
      routeName: RouteName.SLIDER,
    );

    ComponentModel chip = new ComponentModel(
      title: "Chip",
      subtitle: "...",
      icon: GalleryIcons.chips,
      routeName: RouteName.CHIP,
    );

    ComponentModel interactiveElement = new ComponentModel(
        title: "Interactive Element",
        subtitle: "Dialog, Banner, Loading, ...",
        icon: GalleryIcons.dialogs,
        routeName: RouteName.INTERACTIVE_ELEMENT);

    ComponentModel textFields = new ComponentModel(
      title: "Text Fields",
      subtitle: "...",
      icon: GalleryIcons.text_fields_alt,
      routeName: RouteName.TEXT_FIELD,
    );

    ComponentModel bottomNav = new ComponentModel(
      title: "Bottom Navigation Bar",
      subtitle: "...",
      icon: GalleryIcons.bottom_navigation,
      routeName: RouteName.BOTTOM_NAV,
    );

    ComponentModel header = new ComponentModel(
      title: "Header",
      subtitle: "...",
      icon: GalleryIcons.page_control,
      routeName: RouteName.HEADER,
    );

    ComponentModel tabBar = new ComponentModel(
      title: "Tab bar",
      subtitle: "...",
      icon: GalleryIcons.tabs,
      routeName: RouteName.TAB_BAR,
    );

    ComponentModel card = new ComponentModel(
      title: "Card",
      subtitle: "...",
      icon: GalleryIcons.cards,
      routeName: RouteName.CARD,
    );

    ComponentModel toast = new ComponentModel(
      title: "Toast Notification",
      subtitle: "...",
      icon: GalleryIcons.snackbar,
      routeName: RouteName.TOAST,
    );
    ComponentModel dateTime = new ComponentModel(
        title: "Date Time",
        subtitle: "Date Time Selector, Time Picker,...",
        icon: GalleryIcons.event,
        routeName: RouteName.DATE_TIME);
    models.addAll([
      button,
      selectionControl,
      slider,
      chip,
      interactiveElement,
      textFields,
      bottomNav,
      header,
      tabBar,
      dateTime,
      card,
      toast,
    ]);
  }

  List<ComponentModel> getComponents() {
    return models;
  }
}
