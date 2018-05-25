import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
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
  List<HomeItem> homeListData = <HomeItem>[
    new HomeItem(position: 1, name: 'Hello World'),
    new HomeItem(position: 2, name: 'Favorite')
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Home"),
        ),
        body: _homeList(),
        floatingActionButton: new FloatingActionButton(
          tooltip: "Add",
          child: new Icon(Icons.add),
          onPressed: null,
        ),
        primary: true);
  }

  ///ListView
  Widget _homeList() {
    Iterable<Widget> listTiles =
        homeListData.map((HomeItem item) => buildListTile(context, item));
    //增加间隔线
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);
    return new ListView(
      padding: new EdgeInsets.all(16.0),
      children: listTiles.toList(),
    );
  }

  ///构建ListTile
  Widget buildListTile(BuildContext context, HomeItem item) {
    return new ListTile(
      title: new Text(
        item.name,
        style: new TextStyle(fontSize: 18.0),
      ),
      subtitle: new Text('position:${item.position}'),
      onTap: () {
        pushNewPage(item);
      },
    );
  }

  ///跳转到新的页面
  void pushNewPage(HomeItem item) {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("${item.name} Page"),
              centerTitle: true,
            ),
            body: pushPage(item),
          );
        },
      ),
    );
  }

  ///获取新页面
  Widget pushPage(HomeItem item) {
    int position = item.position;
    if (position == 2) {
      return new FavoriteWidget();
    }
    return new HelloWorld();
  }
}

///首页列表Item
class HomeItem {
  HomeItem({this.position, this.name});

  final int position;
  final String name;
}

///Hello Wrold 增加点击事件
class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Center(
        child: new Text("Hello World"),
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
    return new Center(
        child: new Row(
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
    ));
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
