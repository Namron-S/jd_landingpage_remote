import 'package:flutter/material.dart';
//import 'dart:io'; //not supported for web

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
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

  //style-constants:
  static const constIconSize = 25.0;
  static const constFontSize = 14.0;
  static const constHeaderFontSize = 30.0;
  static const constNewsHeaderFontSize = 20.0;
  static const constLeftPadding = 30.0;
  static const constRightPadding = 30.0;
  static const constTopPadding = 20.0;

  Widget getBigSbwyPic(Size size) {
    return Container(
      child: Placeholder(),
      width: size.width,
      height: size.width / 4,
    );

    /*
    //Problem: The package dart.io is not supported in web-projects. So
    // Image.file(File('path')) is not working.
    //see also: https://stackoverflow.com/a/65010513/8120214
    return Container(
      child: Image.file(File('graphics/PIcBigSbwy.png')),
      width: size.width,
      height: size.width / 4,
    );
    */
  }

  Widget getNewsStripe(String header, Size size) {
    return IntrinsicHeight(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Placeholder(
              fallbackWidth: size.width / 6,
              fallbackHeight: size.width / 6,
            ),
            Flexible(
              child: Column(
                children: [
                  Text(header,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: constNewsHeaderFontSize,
                      )),
                  Text('\n'),
                  Text(constStrNullamDictum)
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  color: Colors.yellow[600],
                  child: Text(
                    'Find out more',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () => print('find out more was pressed'),
                ),
              ],
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            Icon(Icons.location_on, color: Colors.green, size: constIconSize),
            Text(
              'Subway Deventer Centrum | Smedenstraat 14.',
              style: TextStyle(fontSize: constFontSize),
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
              size: constIconSize,
            ),
            Text(
              '0570 745 108',
              style: TextStyle(fontSize: constFontSize),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_circle_outlined,
                color: Colors.green, size: constIconSize),
            Icon(Icons.menu, color: Colors.green, size: constIconSize),
          ],
        )
      ],
    ));

    Widget textSection = Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(right: size.width / 15),
            child: Placeholder(
              fallbackWidth: size.width / 4,
              fallbackHeight: size.width / 4,
            ),
          ),
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text('Subway Deventer Centrum',
                        style: TextStyle(
                            fontSize: constHeaderFontSize,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      constStrLoremIpsum,
                    ),
                  ),
                  Text(
                    constStrNullamDictum,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    Widget newsSection = Column(
      children: [
        Text(
          'NEWS',
          style: TextStyle(color: Colors.yellow, fontSize: constHeaderFontSize),
        ),
        getNewsStripe('Monday | 26.10.2020', size),
        getNewsStripe('Wednesday | 21.10.2020', size),
        getNewsStripe('Tuesday | 06.10.2020', size),
      ],
    );

    Widget mainBody = ListView(children: [
      getBigSbwyPic(size),
      Padding(
          padding: EdgeInsets.fromLTRB(
              constLeftPadding, constTopPadding, constRightPadding, 0),
          child: textSection),
      Padding(
          padding: EdgeInsets.fromLTRB(
              constLeftPadding, constTopPadding, constRightPadding, 0),
          child: newsSection),
      Padding(
          padding: EdgeInsets.fromLTRB(
              constLeftPadding, constTopPadding, constRightPadding, 0),
          child: Placeholder()),
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

//Helper Constants:
//normally these Strings are retrieved by a function, but for the case of simplicity we have constants.
  static const String constStrLoremIpsum =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.';
  static const String constStrNullamDictum =
      'Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue.';
}
