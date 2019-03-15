import 'package:flutter/material.dart';

class MyWidgets extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My app',
      home: MyScafflod(),
    );
  }
}


class MyAppBar extends StatelessWidget{
  MyAppBar({this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.black38),
      child: Row(
        children: <Widget>[
          IconButton(
            icon:Icon(Icons.menu),
            tooltip: 'Navigation Menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon:Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null
          )
        ],
      ),
    );
  }
}

class MyScafflod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title:Text(
              'Example title',
              style:Theme.of(context).primaryTextTheme.title,
            )
          ),
          Expanded(
            child: Center(
              child: Text('Hello world!'),
            ),
          )
        ],
      ),
    );
  }
}