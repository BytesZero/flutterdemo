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
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

///主页面
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

///主页面状态
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Example title"),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new MyText(),
              new FavoriteWidget(),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: "Add",
          child: new Icon(Icons.add),
          onPressed: _pushNewPage,
        ),
        primary: true);
  }

  ///跳转到新的页面
  void _pushNewPage() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Hello World Page"),
            ),
            body: new MyText(),
          );
        },
      ),
    );
  }
}

///Hello Wrold 增加点击事件
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        child: new Text("Hello World"),
        margin: new EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 24.0),
      ),
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
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: new IconButton(
              padding: EdgeInsets.zero,
              icon: (_isFavorited
                  ? new Icon(Icons.star)
                  : new Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          child: new Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
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
