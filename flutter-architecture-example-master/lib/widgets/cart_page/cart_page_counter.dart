import 'package:flutter/material.dart';

class CartPageCounter extends StatelessWidget {
  final int _count;

  CartPageCounter(this._count);

  @override
  Widget build(BuildContext context) {    
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border: new Border(
          top: new BorderSide(color: Colors.blueGrey, width: 1.0),
        ),   
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),                  
                  child: Text(
                      '${this._count} Items',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
    // return widget(
    //   child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Container(
    //       decoration: const BoxDecoration(
    //         border: const Border(
    //           top: const BorderSide(width: 10.0, color: Colors.red),
    //         ),
    //       ),
    //       child: new Text(
    //         '34234 items',
    //         style: new TextStyle(
    //           fontSize: 25.0,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
