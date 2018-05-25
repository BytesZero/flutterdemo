import 'package:flutter/material.dart';

///Hello Wrold 增加点击事件
class HelloWorldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new GestureDetector(
        onTap: () {
          final snackBar = new SnackBar(content: new Text("Tap"));
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: new Center(
          child: new Text("Hello World"),
        ),
      ),
    );
  }
}
