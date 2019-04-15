import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Input'),
        ),
        body: new TextInput(),
      )
    );
  }
}

class TextInput extends StatefulWidget {
  TextInput({Key key}) : super(key: key);
  @override
  _TextInputState createState() => new _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(
            hintText: 'Type Something',
          ),
        ),
        new RaisedButton(
          child: new Text('DONE'),
          onPressed: () {
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text('what you typed'),
                content: new Text(_controller.text),
              )
            );
          }
        )
      ],
    );
  }
}