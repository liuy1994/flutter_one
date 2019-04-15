import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      title: 'App One',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final suggestions = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 20);
  final saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Start up Generator'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: pushSaved,
          )
        ],
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildRow(WordPair pair) {
    final alreadySaved = saved.contains(pair);
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if(alreadySaved) {
              saved.remove(pair);
            } else {
              saved.add(pair);
            }
          });
        },
    );
  }

  Widget buildSuggestions() {
    return new ListView.builder(
      padding: new EdgeInsets.all(8),
      itemBuilder: (context, i) {
        if(i.isOdd) {
          return new Divider();
        }
        final index = i ~/ 2;
        if(index >= suggestions.length) {
          suggestions.addAll(generateWordPairs().take(10));
        }
        return buildRow(suggestions[index]);
      },
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: biggerFont
                ),
              );
            }
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions')
            ),
            body: new ListView(
              children: divided,
            )
          );
        }
      )
    );
  }

}