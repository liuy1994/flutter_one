import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _AnimatedListSampleState createState() => new _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<MyApp> {
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectdItem;
  int _nextItem;

  @override
  void initState() {
    super.initState();
    _list = new ListModel<int>(
        listKey: _listKey,
        removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
        animation: animation,
        item: _list[index],
      selected: _selectdItem == _list[index],
      onTap: () {
          setState(() {
            _selectdItem = _selectdItem == _list[index] ? null : _list[index];
          });
      },
    );
  }

  Widget _buildRemovedItem(int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      selected: false,
    );
  }

  void _insert() {
    final int index = _selectdItem == null ? _list.length : _list.indexOf(_selectdItem);
    _list.insert(index, _nextItem++);
  }

  void _remove() {
    if(_selectdItem != null) {
      _list.removeAt(_list.indexOf(_selectdItem));
      setState(() {
        _selectdItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('AnimatedList'),
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert, tooltip: 'insert a new item'
            ),
            new IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: _remove, tooltip: 'remove a new item'
            )
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16),
          child: new AnimatedList(
            itemBuilder: _buildItem,
            key: _listKey,
            initialItemCount: _list.length,
          ),
        ),
      ),
    );
  }
}

class ListModel<E> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initItems,
  }) : assert(listKey != null),
       assert(removedItemBuilder != null),
       _items = new List<E>.from(initItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removeItem = _items.removeAt(index);
    if(removeItem != null) {
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removeItem, context, animation);
      });
    }
  }

  int get length => _items.length;
  E operator [](int index) => _items[index];
  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.animation,
    this.onTap,
    @required this.item,
    this.selected: false,
  }) : assert(animation != null),
       assert(item != null && item >= 0),
       assert(selected != null),
       super(key: key);
  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if(selected) textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return new Padding(
      padding: const EdgeInsets.all(2),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text('Item $item', style: textStyle,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}