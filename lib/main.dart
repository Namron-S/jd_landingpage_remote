/*  open issues:

1.  Load images: Problem: The package dart.io is not supported in web-projects. So
    Image.file(File('path')) is not working.
    see also: https://stackoverflow.com/a/65010513/8120214
    -> einen Workaround finden

2.  Code aufräumen: Style-Konstanten (Schriftgröße, Farbe,...) in separate Datei speichern
    und überall verwenden: hard-coded values vermeiden

3.  App zu 100% "resizable" machen: Wenn das Fenster zu klein wird gibt es
    einen Bottom Overflow in der News-Section und im Footer.

4.  die richtigen Firmen Logos im Footer finden.

5.  Social Media Section erstellen

*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      title: 'JD-Company Landingpage',
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
  static const Color constMainColor = Colors.orangeAccent;

  Widget getHeaderPicture(Size size) {
    return Image.network(//ids: 1081,
        'https://picsum.photos/id/214/${size.width}/${size.width / 8}');
  }

  Widget getNewsStripe(String header, Size size) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Placeholder(
                  fallbackWidth: size.width / 6,
                  fallbackHeight: size.width / 6,
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(right: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(header,
                          style: TextStyle(
                            color: constMainColor,
                            fontSize: constNewsHeaderFontSize,
                          )),
                      Text('\n'),
                      Text(constStrNullamDictum)
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.yellow[600],
                      child: Text(
                        'Find out more',
                        style: TextStyle(color: constMainColor),
                      ),
                      onPressed: () => print('find out more was pressed'),
                    ),
                  ),
                ],
              )
            ]),
      ),
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
        Container(
          child: FlutterLogo(),
          padding: EdgeInsets.all(2),
          color: constMainColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, color: constMainColor, size: constIconSize),
            Text(
              'JD-Company JD City | JD-street 14.',
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
              color: constMainColor,
              size: constIconSize,
            ),
            Text(
              '+1 745 108',
              style: TextStyle(fontSize: constFontSize),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_circle_outlined,
                color: constMainColor, size: constIconSize),
            Icon(Icons.menu, color: constMainColor, size: constIconSize),
          ],
        )
      ],
    ));

    Widget textSection = Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(right: size.width / 40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(//ids: 1081, 214
                  'https://picsum.photos/id/1081/${size.width / 4}/${size.width / 4}')

              /*Placeholder(
                fallbackWidth: size.width / 4,
                fallbackHeight: size.width / 4,
              )*/
              ,
            ),
          ),
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text('General Informations',
                        style: TextStyle(
                            fontSize: constHeaderFontSize,
                            color: constMainColor,
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
          'NEWS\n',
          style: TextStyle(color: Colors.yellow, fontSize: constHeaderFontSize),
        ),
        getNewsStripe('Monday | 26.10.2020', size),
        getNewsStripe('Wednesday | 21.10.2020', size),
        getNewsStripe('Tuesday | 06.10.2020', size),
      ],
    );

    Widget mainBody = ListView(children: [
      getHeaderPicture(size),
      Padding(
          padding: EdgeInsets.fromLTRB(
              constLeftPadding, constTopPadding + 50, constRightPadding, 0),
          child: textSection),
      Padding(
          padding: EdgeInsets.fromLTRB(
              constLeftPadding, constTopPadding, constRightPadding, 0),
          child: newsSection),
    ]);

    Widget bottomNavBar = Container(
      height: size.height / 7,
      color: constMainColor,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: Text(
              '\u00a9 2020 | JD-Compnay US | Contact | Menu | Terms of Service | Work for JD-Company',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text('Follow us',
                style: TextStyle(color: Colors.orangeAccent, fontSize: 13)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebookSquare),
                  onPressed: () {
                    print("Pressed");
                  }),
              IconButton(
                  icon: FaIcon(FontAwesomeIcons.google),
                  onPressed: () {
                    print("Pressed");
                  }),
              IconButton(
                  icon: FaIcon(FontAwesomeIcons.linkedin),
                  onPressed: () {
                    print("Pressed");
                  }),
            ],
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: titleSection,
      ),
      body: mainBody,
      bottomNavigationBar: bottomNavBar,
    );
  }

//Helper Constants:
//normally these Strings are retrieved by a function, but for the case of simplicity we have constants.
  static const String constStrLoremIpsum =
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.';
  static const String constStrNullamDictum =
      'Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue.';
}
