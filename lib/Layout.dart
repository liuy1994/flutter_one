import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('layout'),
        ),
        body: new ListView(
          children: <Widget>[
//            new ImageSection(),
//            new TitleSection(),
//            new ButtonSection(),
//            new TextSection(),
//            new StarsSection()
          ],
        ),
//      body: new Center(
//        child: new BuildGrid(),
//      ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Image.asset(
        'images/gj01.jpg',
        height: 240,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(32),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: new Text(
                    '标题栏的标题',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  '标题栏的副标题',
                  style: new TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41')
        ],
      ),
    );
  }
}

Column buildButtonColumn(IconData icon, String label, BuildContext context) {
  Color color = Theme.of(context).primaryColor;
  return new Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Icon(icon, color: color,),
      new Container(
        margin: const EdgeInsets.only(top: 8),
        child: new Text(
          label,
          style: new TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL', context),
          buildButtonColumn(Icons.near_me, 'ROUTE', context),
          buildButtonColumn(Icons.share, 'SHARE', context),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(32),
      child: new Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
            'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
            'A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, '
            'leads you to the lake, which warms to 20 degrees Celsius in the summer. '
            'Activities enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }
}

class StarsSection extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Icon(Icons.star, color: Colors.green[100]),
        new Icon(Icons.star, color: Colors.green[300]),
        new Icon(Icons.star, color: Colors.green[500]),
        new Icon(Icons.star, color: Colors.green[700]),
        new Icon(Icons.star, color: Colors.green[900]),
      ],
    );
  }
}

List<Container> _buildGridTileList(int count) {
  return new List<Container>.generate(
    count, (int index) => new Container(child: new Text('Text $index'),)
  );
}

class BuildGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(30),
    );;
  }
}

class StackSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/gj01.jpg'),
          radius: 100,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45
          ),
        )
      ],
    );
  }
}