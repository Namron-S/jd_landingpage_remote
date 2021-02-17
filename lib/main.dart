/*  open issues:
1.  App zu 100% "resizable" machen: Wenn das Fenster zu schmal wird gibt es
    einen Bottom Overflow in der News-Section.
2.  Icons clickable machen und entsprechende Meldung in einem "Info-Fenster" ausgeben.
*/
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Image.network(
        'https://picsum.photos/id/214/${(size.width).floor()}/${(size.width / 8).floor()}');
  }

  Widget getNewsStripe(String header, Size size, BuildContext ctx) {
    //>= 890 ist ok für die news Section
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
                'https://picsum.photos/id/1073/${(size.width / 5).floor()}/${(size.width / 5).floor()}'),
          ),
          Flexible(
            //Dieses Flexible: ListView akzeptiert nicht "width:Infinity" von der Row
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.width / 5,
                //maxWidth: 400,
              ),
              child: Container(
                //Container: Nur für Debugging da, um den Bereich rot zu sehn
                color: Colors.red,
                child: ListView(
                  children: [
                    Text(header,
                        style: TextStyle(
                          color: constMainColor,
                          fontSize: constNewsHeaderFontSize,
                        )),
                    Text('\n'),
                    Text(constStrNullamDictum) //Text(constStrNullamDictum)
                  ],
                ),
              ),
            ),
          ),
          FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Colors.yellow[600],
            child: Text(
              'Find out more',
              style: TextStyle(color: constMainColor),
            ),
            onPressed: () =>
                showAlertDialog(ctx, 'Find out more\n was pressed'),
          )
        ]);
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
            IconButton(
                icon: Icon(Icons.location_on,
                    color: constMainColor, size: constIconSize),
                onPressed: () =>
                    showAlertDialog(context, 'Open Google Maps...')),
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
            IconButton(
                icon: Icon(
                  Icons.phone,
                  color: constMainColor,
                  size: constIconSize,
                ),
                onPressed: () => showAlertDialog(context, 'Open Phone App...')),
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
            IconButton(
              icon: Icon(Icons.account_circle_outlined,
                  color: constMainColor, size: constIconSize),
              onPressed: () =>
                  showAlertDialog(context, 'Open account settings...'),
            ),
            IconButton(
                icon: Icon(Icons.menu,
                    color: constMainColor, size: constIconSize),
                onPressed: () => showAlertDialog(context, 'Open menue...')),
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
                  'https://picsum.photos/id/1081/${(size.width / 4).floor()}/${(size.width / 4).floor()}')

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
        getNewsStripe('Monday | 26.10.2020', size, context),
        getNewsStripe('Wednesday | 21.10.2020', size, context),
        getNewsStripe('Tuesday | 06.10.2020', size, context),
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
      //Minimum height: 63 (durch ausprobieren herausgefunden)
      height: size.height / 8 > 63 ? size.height / 8 : 63,
      color: constMainColor,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              '\u00a9 2020 | JD-Compnay US | Contact | Menu | Terms of Service | Work for JD-Company',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  iconSize: size.height / 20,
                  icon: FaIcon(FontAwesomeIcons.facebookSquare),
                  onPressed: () {
                    showAlertDialog(context, 'Follow us on facebook');
                  }),
              IconButton(
                  iconSize: size.height / 20,
                  icon: FaIcon(FontAwesomeIcons.google),
                  onPressed: () {
                    showAlertDialog(context, 'Follow us on Google ;)');
                  }),
              IconButton(
                  iconSize: size.height / 20,
                  icon: FaIcon(FontAwesomeIcons.linkedin),
                  onPressed: () {
                    showAlertDialog(context, 'Follow us on LinkedIn');
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

Future<void> showAlertDialog(BuildContext context, String msg) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Info'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
