import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _state createState() => new _state();
}

class _state extends State<MyApp> {
  int value = 0;

  String fValue = '';

  void onClick() {
    setState(() {
      fValue = new DateTime.now().toString();
    });
  }

  String bValue = '';

  void onbClick(String value) {
    setState(() {
      bValue = value;
    });
  }

  void add() {
    setState(() {
      value++;
    });
  }

  void remove() {
    setState(() {
      value--;
    });
  }

  List<BottomNavigationBarItem> items;
  String bottomValues = '';
  int index = 0;

  @override
  void initState() {
    items = new List();

    items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.account_box), title: new Text('Account')));

    items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.airplanemode_active), title: new Text('Air')));

    items.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.brightness_5), title: new Text('Sun')));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Title'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: add),
          new IconButton(icon: new Icon(Icons.remove), onPressed: remove)
        ],
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(
            icon: new Icon(Icons.account_balance),
            onPressed: () => onbClick('Footer Button 1')),
        new IconButton(
            icon: new Icon(Icons.add_location),
            onPressed: () => onbClick('Footer Button 2')),
        new IconButton(
            icon: new Icon(Icons.add_shopping_cart),
            onPressed: () => onbClick('Footer Button 3')),
      ],
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Text("Hello Drawer"),
              new RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('close'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: onClick,
        backgroundColor: Colors.cyan,
        mini: false,
        child: new Icon(Icons.access_alarm),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(
                value.toString(),
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 37.0),
              ),
              new Text(
                fValue,
                style:
                    new TextStyle(fontStyle: FontStyle.italic, fontSize: 25.0),
              ),
              new Text(
                bValue,
                style:
                    new TextStyle(fontStyle: FontStyle.italic, fontSize: 40.0),
              ),
              new Text(
                bottomValues,
                style: new TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 40.0,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: items,
        fixedColor: Colors.blue,
        currentIndex: index,
        onTap: (int item) {
          setState(() {
            index = item;
            bottomValues = 'Current value ${index.toString()}';
          });
        },
      ),
    );
  }
}
