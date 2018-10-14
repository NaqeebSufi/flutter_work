import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  //Background Image Code Starts From here
  @override
  Widget build(BuildContext context) {

    List<DropdownMenuItem<String>> listDrop = [];
   loadData() {
  listDrop = [];
  listDrop.add(new DropdownMenuItem(
    child: new Text('Item 1'),
    value: "1",
  ));
  listDrop.add(new DropdownMenuItem(
    child: new Text('Item 2'),
    value: "2",
  ));
  listDrop.add(new DropdownMenuItem(
    child: new Text('Item 3'),
    value: "3",
  ));
}
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage('asset/bg.png'),
          fit: BoxFit.cover,
        ),
        new Theme(
          
          child: Container(
           
            padding: const EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 00.0),
           
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('asset/I2.png'),
                alignment: Alignment.topRight,
              ),
            ),

            child: new Container(
               

    alignment: Alignment.centerRight,
    padding: new EdgeInsets.only(top: 400.0),
    child: new DropdownButton(
      
      items: listDrop,
      hint: new Text('Select Items'),
      onChanged: loadData()
    ),
  ),
          ),
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme()),
          isMaterialAppTheme: true,         
        ),
        ImageRotate()
      ]),
    );
  }
}

//Background Image Code Ends From here

//Animation code starts from here
class ImageRotate extends StatefulWidget {
  @override
  _ImageRotateState createState() => new _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  static var rng = new Random();
  double random_number = 0.0;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: random_number.toInt()),
    );
    

    /*
      animationController.repeat();
    animationController.addListener((){
		  this.setState((){
         animationController.forward();
      }); 
	  });
	 animationController.forward();*/
  }

  void move() {
    double random_number = (5 +
        ((rng.nextInt((5 - 1).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil())) /
            4000.0));
    double random_number1 = (4 +
        ((rng.nextInt((5 - 1).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil())) /
            4000.0));

    print(random_number);
/*
   
    animationController = new AnimationController(
      vsync: this,
      duration:    Duration(seconds: random_number.toInt()),
    );
*/
    animationController.duration = Duration(seconds: random_number.toInt());
    animationController.forward(from: -1.0);

    animationController.repeat();
    print(animationController.value);
    print(animationController.value * random_number1);
    animationController.addListener(() {
      this.setState(() {
        animationController.forward();
      });
    });
        
         //animationController.forward();
         
         }

  @override
  Widget build(BuildContext context) {
    double random_number3 = (60 +
        ((rng.nextInt((5 - 1).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil() * 1000) +
                rng.nextInt((30 - 10).ceil())) /
            4000.0));

    return new Container(
      height: 150.0,
      width: 150.0,
      padding: new EdgeInsets.fromLTRB(110.0, 150.0, 100.0, 420.0),
      alignment: Alignment.bottomCenter,
      child: new AnimatedBuilder(
        animation: animationController,
        child: new GestureDetector(
          child: new Image.asset('asset/5.png'),
          onTap: () {
            move();
          },
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * random_number3.toInt(),
            child: _widget,
          );
        },
      ),
    );
  }
}
//Animation code Ends from here

List<DropdownMenuItem<String>> listDrop = [];
void loadData() {
  listDrop = [];
  listDrop.add(new DropdownMenuItem(
    child: new Text('Item 1'),
    value: "1",
  ));
  listDrop.add(new DropdownMenuItem(
    child: new Text('Item 2'),
    value: "2",
  ));
  listDrop.add(new DropdownMenuItem(
    child: new Text('Item 3'),
    value: "3",
  ));
}

// @override

Widget build(BuildContext context) {
  loadData();
  return Container(
    alignment: Alignment.bottomLeft,
    //padding: new EdgeInsets .fromLTRB(100.0, 1.0, 100.0, 400.0),
    child: new DropdownButton(
      items: listDrop,
      hint: new Text('Select Items'),
      onChanged: null,
    ),
  );
}