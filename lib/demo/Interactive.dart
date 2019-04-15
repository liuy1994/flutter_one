import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('App Bar')
        ),
        body: new Column(
          children: <Widget>[
            new FavoriteWidget()
          ],
        ),
      )
    );
  }
}

class TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}





class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      _favoriteCount = _isFavorited ? _favoriteCount - 1 : _favoriteCount + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.all(0),
          child: new IconButton(
            icon: _isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
        new SizedBox(
          width: 18,
          child: new Container(child: new Text('$_favoriteCount'),),
        )
      ],
    );
  }
}