import 'package:flutter/material.dart';

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
