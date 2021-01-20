import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subway Landingpage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        child: Row(
      children: [FlutterLogo(), Text('xxx')],
    ));

    Widget mainBody = ListView(children: [
      FlutterLogo(),
      FlutterLogo(),
      FlutterLogo(),
      FlutterLogo(),
      FlutterLogo(),
    ]);

    Widget bottomSheet = Container(
      child: Row(
        children: [Text('xxx'), Text('xxx')],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: titleSection,
      ),
      body: mainBody,
      bottomSheet: bottomSheet,
    );
  }
}
