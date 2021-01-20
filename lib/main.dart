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
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = 12.0;
    const fontSize = 8.0;
    Widget titleSection = Container(
        child: Row(
      children: [
        FlutterLogo(),
        Icon(Icons.location_on, color: Colors.green, size: iconSize),
        Text(
          'Subway Deventer Centrum | Smedenstraat 14.',
          style: TextStyle(fontSize: fontSize),
        ),
        Icon(
          Icons.phone,
          color: Colors.green,
          size: iconSize,
        ),
        Text(
          '0570 745 108',
          style: TextStyle(fontSize: fontSize),
        ),
        Icon(Icons.account_circle_outlined,
            color: Colors.green, size: iconSize),
        Icon(Icons.menu, color: Colors.green)
      ],
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
