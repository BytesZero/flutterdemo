import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = const Color(0xFF0175c2);
    final ThemeData base = new ThemeData.light();
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: base.copyWith(
        primaryColor: primaryColor,
      ),
      home: new TutorialHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: new Icon(
                Icons.menu,
                color: Colors.white,
              ),
              tooltip: "Navigation menu",
              onPressed: null),
          title: new Text("Example title"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                tooltip: "Search",
                onPressed: null),
          ],
        ),
        body: new Center(
          child: new FavoriteWidget(),
        ),
        floatingActionButton: new FloatingActionButton(
            tooltip: "Add", child: new Icon(Icons.add), onPressed: null),
        primary: true);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Text("Hello World"),
    );
  }
}

///创建一个有状态的Widget
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

///创建状态
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true; //是否收藏
  int _favoriteCount = 41; //收藏个数

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              padding: new EdgeInsets.all(0.0),
              icon: (_isFavorited
                  ? new Icon(Icons.star)
                  : new Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  ///切换收藏状态
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}
