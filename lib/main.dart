import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Start up Generator'),
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildRow(WordPair pair) {
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: biggerFont,
        )
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

}