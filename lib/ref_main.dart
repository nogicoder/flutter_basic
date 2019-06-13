import "package:flutter/material.dart";
import "package:english_words/english_words.dart";

void main() => runApp(MyApp());

final _collections = <WordPair>[];
final _favourites = Set<WordPair>();

class Data {
  dynamic context;

  Data(this.context);
}

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
        title: "Name Generator",
        theme: ThemeData(
          primaryColor: Color(0xFF142d4c),
          scaffoldBackgroundColor: Color(0xFFececec),
        ),
        home: WordGen());
  }
}

class WordGen extends StatefulWidget {
  createState() => WordGenState();
}

class WordGenState extends State<WordGen> {
  
  _generateTile(WordPair pair) {
    final favoured = _favourites.contains(pair);
    return ListTile(
        title: Text(pair.asPascalCase,
            style: TextStyle(fontSize: 18, color: Colors.black45)),
        trailing: Icon(favoured ? Icons.bookmark : Icons.bookmark_border,
            color: favoured ? Colors.red : Colors.blueAccent),
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

  void _changeScreen() {
    Navigator.push(context, 
      MaterialPageRoute<void>(
        builder: (context) => SecondRoute()
      )
    );
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Generator"),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _changeScreen)]
      ),
      body: _createWordList()
    );
  }
}

class SecondRoute extends StatelessWidget {
  static Iterable<ListTile> tiles = _favourites.map(
    (WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      );
    },
  );

  @override
  build(context) {
    final List<Widget> divided = ListTile
    .divideTiles(
      context: context,
      tiles: tiles,
    )
    .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}