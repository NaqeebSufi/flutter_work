import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new ExampleWidget()));
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      width: 300.0,
      height: 300.0,
      decoration: new BoxDecoration(
        color: Colors.purple,
        shape: BoxShape.circle,
      ),
    );

    return new Material(
      color: Colors.black,
      child: new Center(
        child: new Stack(
          children: <Widget>[
            bigCircle,
            new Positioned(
              child: new CircleButton(onTap: () => print("Love"), iconData: Icons.looks_one),
              top: 10.0,
              left: 130.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Time"), iconData: Icons.looks_3),
              top: 170.0,
              left: 20.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Location"), iconData: Icons.looks_6),
              top: 75.0,
              right: 20.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Pizza"), iconData: Icons.looks_4),
              top: 240.0,
              left: 120.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Pizza"), iconData: Icons.looks_two),
              top: 65.0,
              left: 25.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Satellite"), iconData: Icons.looks_5),
              top: 180.0,
             right: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
} 