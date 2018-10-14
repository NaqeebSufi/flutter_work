import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginflutter/AdminPage.dart';
import 'package:loginflutter/MemberPage.dart';

void main() => runApp(new MyApp());

String username='';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',     
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/AdminPage': (BuildContext context)=> new AdminPage(username: username,),
        '/MemberPage': (BuildContext context)=> new MemberPage(username: username,),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController user=new TextEditingController();
TextEditingController pass=new TextEditingController();

String msg='';
var response = '[{"id": "1", "username" : "indra", "password" : "12345", "level" : "admin"}]';

Future<List> _login() async {
   print("hii");
  final response = await http.post("response", body: {
    "username": user.text,
    "password": pass.text,
  
  });
    

  var datauser = json.decode(response.body);

  if(datauser.length==0)
  {
    
        Navigator.pushReplacementNamed(context, '/AdminPage');

  }else{
   
       Navigator.pushReplacementNamed(context, '/AdminPage');
    

  }

  return datauser;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(   
                controller: user,                
                decoration: InputDecoration(
                  hintText: 'Username'
                ),           
                ),
              Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: pass,  
                obscureText: true,                
                 decoration: InputDecoration(
                  hintText: 'Password'
                ),                
                ),
              
              RaisedButton(
                child: Text("Login"),
                onPressed: (){
               // print("hii1");
                  _login();
                  
                },
              ),

              Text(msg+"bla",style: TextStyle(fontSize: 20.0,color: Colors.red),)
             

            ],
          ),
        ),
      ),
    );
}
}