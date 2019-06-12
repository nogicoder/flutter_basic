import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      title: "Name Generator",
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.yellow[100],
      ),
      home: WordGen()
    );
  }
}

class WordGen extends StatefulWidget {
  createState() => WordGenState();
}

class WordGenState extends State<WordGen> {
  void _displayFavourites() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          
          final tiles = _favourites.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: TextStyle(fontSize: 18, color: Colors.red)
                )
              );
            }
          );

          final divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles
          )
          .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text("Favourites"),
            ),
            body: ListView(children: divided)
          );
        } 
      )
    );
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _displayFavourites
          )
        ],
      ),
      body: _createWordList()
    );
  }

  final _collections = <WordPair>[];
  final _favourites = Set<WordPair>();

  _generateTile(WordPair pair) {
    final favoured = _favourites.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18, color: Colors.red)
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