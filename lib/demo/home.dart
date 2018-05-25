import 'package:flutter/material.dart';
import 'favorite.dart';
import 'helloworld.dart';

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
      padding: new EdgeInsets.all(0.0),
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
    return new HelloWorldWidget();
  }
}

///首页列表Item
class HomeItem {
  HomeItem({this.position, this.name});

  final int position;
  final String name;
}
