import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      title: "Name Generator",
      home: WordGen()
    );
  }
}

class WordGen extends StatefulWidget {
  createState() => WordGenState();
}

class WordGenState extends State<WordGen> {
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        backgroundColor: Color(0xFFFF9000),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list),)
        ],
      ),
      body: _createWordList()
    );
  }

  final _collections = <WordPair>[];
  final _favourites = Set<WordPair>();
  final _bookmark = Icons.bookmark;

  _generateTile(WordPair pair) {
    final favoured = _favourites.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18)
      ),
      trailing: Icon(
        favoured ? Icons.bookmark : Icons.bookmark_border,
        color: favoured ? Colors.red : Colors.blueAccent
      ),
      onTap: () {
        setState(() {
          if (favoured) {
            _favourites.remove(pair);
          } else {
            _favourites.add(pair);
          }
        });
      }
    );
  }

  _createWordList() {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        
        if (index >= _collections.length) {
          _collections.addAll(generateWordPairs().take(10));
        }
        
        return _generateTile(_collections[index]);
      }
    );
  }
}