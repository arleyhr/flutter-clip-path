import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: MyHomePage(),
      ),
    );
  }
}

Widget buildAppBarContent () {
  return ClipPath(
    clipper: AppBar(),
    child: Container(
      alignment: Alignment.topCenter,
      color: Color.fromRGBO(81, 116, 243, 1),
      padding: EdgeInsets.only(top: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: IconButton(
              iconSize: 40.0,
              color: Colors.white,
              onPressed: () {},
              icon: Icon(
                Icons.menu
              ),
            ),
          ),
          Text(
              "Find a place",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              )
          )
        ],
      )
    ),
  );
}

Widget buildAppBarShadow () {
  return Container(
    child: ClipPath(
      clipper: ShadowBar(),
      child: Container(
        color: Color.fromRGBO(81, 116, 243, 0.5)
      ),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            buildAppBarShadow(),
            buildAppBarContent(),
          ],
        )
      )
    );
  }
}

class ShadowBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    final height = size.height;
    final width = size.width;

    path.lineTo(0.0, 0.0);// left-top
    path.lineTo(width, 0);// right-top
    path.lineTo(width, height * 0.3);

    // right bezier
    path.quadraticBezierTo(
        width, height * 0.75,
        width * 0.7, height * 0.80
    );
    path.lineTo(width * 0.3, height * 0.93);

    // left bezier
    path.quadraticBezierTo(
        width * 0.2, height,
        0.0, height * 0.2
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

class AppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    final height = size.height * 0.85;
    final width = size.width;

    path.lineTo(0.0, 0.0);// left-top
    path.lineTo(width, 0);// right-top
    path.lineTo(width, height * 0.3);

    // right bezier
    path.quadraticBezierTo(
        width, height * 0.7,
        width * 0.8, height * 0.8
    );
    path.lineTo(width * 0.15, height);

    // left bezier
    path.quadraticBezierTo(
        width * 0.05, height,
        0.0, height * 0.6
    );
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



