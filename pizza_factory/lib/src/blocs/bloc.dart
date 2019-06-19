import 'dart:async';

class Bloc {
  //Our pizza house
  final order = StreamController<String>();

  //Pizza house menu and quantity
  static final _pizzaList = {
    "Sushi": 2,
    "Neapolitan": 3,
    "California-style": 4,
    "Marinara": 2
  };

  //This is Mia
  void orderItem(String pizza) {
    order.sink.add(pizza);
  }

  //Our collect office
  Stream<String> get orderOffice => order.stream.transform(validateOrder);

  //Different pizza images
  static final _pizzaImages = {
    "Sushi": "http://pngimg.com/uploads/pizza/pizza_PNG44077.png",
    "Neapolitan": "http://pngimg.com/uploads/pizza/pizza_PNG44078.png",
    "California-style": "http://pngimg.com/uploads/pizza/pizza_PNG44081.png",
    "Marinara": "http://pngimg.com/uploads/pizza/pizza_PNG44084.png"
  };

  //Validate if pizza can be baked or not.
  // This is John
  final validateOrder =
      StreamTransformer<String, String>.fromHandlers(handleData: (order, sink) {
    if (_pizzaList[order] != null) {
      //pizza is available
      if (_pizzaList[order] != 0) {
      
        //pizza can be delivered
        sink.add(_pizzaImages[order]);

        _pizzaList[order]--;

      } else {
        //out of stock
        sink.addError("Out of stock");
      }
    } else {
      //pizza is not in the menu
      sink.addError("Pizza not found");
    }
  });
}
