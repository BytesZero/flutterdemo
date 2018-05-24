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
          child: new MyText(),
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
