import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('App Bar')
        ),
        body: new Center(
          child: new Text('23333')
        ),
      )
    );
  }
}