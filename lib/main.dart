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

  Widget getBigSbwyPic(Size size) {
    return Container(
      child: Placeholder(),
      width: size.width,
      height: size.width / 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    const iconSize = 15.0;
    const fontSize = 8.0;
    MediaQueryData media = MediaQuery.of(context);
    Size size = media.size;

    Widget titleSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        FlutterLogo(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, color: Colors.green, size: iconSize),
            Text(
              'Subway Deventer Centrum | Smedenstraat 14.',
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.phone,
              color: Colors.green,
              size: iconSize,
            ),
            Text(
              '0570 745 108',
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_circle_outlined,
                color: Colors.green, size: iconSize),
            Icon(Icons.menu, color: Colors.green, size: iconSize),
          ],
        )
      ],
    ));

    Widget textSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Placeholder(
            fallbackWidth: size.width / 3,
            fallbackHeight: size.width / 3,
          ),
          Column(
            children: [Text('Subway Deventer Centrum'), Text('Lorem Ipsum')],
          )
        ],
      ),
    );

    Widget mainBody = ListView(children: [
      getBigSbwyPic(size),
      textSection,
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
