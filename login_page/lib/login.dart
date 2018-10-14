import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'json.dart';
String email;
String password;

class LoginPage extends StatefulWidget {
 
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

      
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  //String url_ = "https://projects.myservicesdesk.com/flutter/api/authentication.php?email=admin@example.com&password=admin";
  //String url_a = "https://projects.myservicesdesk.com/flutter/api/authentication.php?+$input1.com&password=$input2";
   
  TextEditingController  _textController = new  TextEditingController();
  TextEditingController  _textController2 = new  TextEditingController();
  

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
      email = _textController.text;
      password = _textController2.text;
    
  }

   

  @override
  Widget build(BuildContext context) {

    setState(() {
 
     
    });
      

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/2.jpg"),
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black87,
        ),
        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 140.0,
              ),
              new Container(
                padding: const EdgeInsets.all(25.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        
                        controller: _textController,
                        decoration: new InputDecoration(
                            labelText: "Enter Email", fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        controller: _textController2,
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Icon(FontAwesomeIcons.signInAlt),
                        onPressed: () {Navigator.of(context).pushNamed('/json.dart');},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
 
  }
  
}