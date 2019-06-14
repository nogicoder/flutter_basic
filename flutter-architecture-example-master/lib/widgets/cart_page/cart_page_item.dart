import 'package:flutter/material.dart';

class CartPageItem extends StatelessWidget {
  final String _title;
  final String _address;
  final int _count;

  CartPageItem(this._title, this._address, this._count);

  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: const EdgeInsets.all(10.0),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.account_balance),
            title: new Text(this._title),
            subtitle: new Text(this._address),
          ),
          new ButtonTheme.bar(
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: new Text('X${this._count}'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
