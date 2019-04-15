import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'V2EX Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text('V2ex'),
          ),
        ),
        body: new Center(
          child: new  Text('V2ex content'),
        ),
      ),
    );
  }
}