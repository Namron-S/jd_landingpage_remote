import 'dart:ui';

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

  //For getting the Color of a TextButton:
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.deepOrangeAccent;
    }
    return constMainColor;
  }

  Widget getNewsStripe(String header, Size size, BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[100],
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      // color: Colors.grey,
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                  'https://picsum.photos/id/1073/${(size.width / 7).floor()}/${(size.width / 7).floor()}'),
            ),
            Flexible(
              //Dieses Flexible: ListView akzeptiert nicht "width:Infinity" von der Row
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: size.width / 7,
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  //color: Colors.red,
                  child: Column(
                    children: [
                      Text(header,
                          style: TextStyle(
                            color: constMainColor,
                            fontSize: constNewsHeaderFontSize,
                          )),
                      Flexible(
                        child: ListView(
                          children: [
                            Text('\n'),
                            Text(constStrNullamDictum +
                                constStrLoremIpsum +
                                constStrNullamDictum) //Text(constStrNullamDictum)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 5,
                right: 5,
              ),
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      textStyle: MaterialStateProperty.all(
                          TextStyle(color: Colors.black)),
                      backgroundColor:
                          MaterialStateProperty.resolveWith(getColor)),
                  onPressed: () =>
                      showAlertDialog(ctx, 'Find out more\n was pressed'),
                  child: Text('Find out more')),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final Size size = media.size;

    final Widget titleSection = Container(
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
              'JD City | JD-street 14.',
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

    final Widget textSection = Container(
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

    final Widget newsSection = Column(
      children: [
        Text(
          'NEWS\n',
          style:
              TextStyle(color: constMainColor, fontSize: constHeaderFontSize),
        ),
        getNewsStripe('Monday | 26.10.2020', size, context),
        getNewsStripe('Friday | 23.10.2020', size, context),
        getNewsStripe('Thursday | 22.10.2020', size, context),
        getNewsStripe('Wednesday | 21.10.2020', size, context),
        getNewsStripe('Tuesday | 20.10.2020', size, context),
        getNewsStripe('Monday | 19.10.2020', size, context),
        getNewsStripe('Friday | 16.10.2020', size, context),
        getNewsStripe('Thursday | 15.10.2020', size, context),
        getNewsStripe('Wednesday | 14.10.2020', size, context),
      ],
    );

    final Widget mainBody = ListView(children: [
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

    final Widget bottomNavBar = Container(
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
                  iconSize: size.height / 25,
                  icon: Icon(Icons.business),
                  onPressed: () {
                    showAlertDialog(context, 'Follow John Doe on ...');
                  }),
              IconButton(
                  iconSize: size.height / 25,
                  icon: Icon(Icons.follow_the_signs),
                  onPressed: () {
                    showAlertDialog(context, 'Follow John Doe on ... ');
                  }),
              IconButton(
                  iconSize: size.height / 25,
                  icon: Icon(Icons.business_center),
                  onPressed: () {
                    showAlertDialog(context, 'Follow John Doe on ...');
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
          TextButton(
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
