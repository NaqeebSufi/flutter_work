import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: new HomePage(),
    );
  }
}
class HomePage extends StatefulWidget { 
  
  @override
    _HomePageState createState() => new _HomePageState();

}
class _HomePageState extends State<HomePage>{
  String _url="https://swapi.co/api/people/";
  List data;

  @override
  void initState()
  { super.initState();
    this.getjsondata();}

  Future<String>getjsondata() async{
      var response =await http.get(
        Uri.encodeFull(_url),
      headers: {"Accept":"appliation/json"}
      );
    print(response.body);
    setState((){
      var convertDataTOjson=json.decode(response.body);
      data=convertDataTOjson['results'];
    });
  return "sucess";
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HomePage"),
        ),
        body: new ListView.builder(
            itemCount:data==null ? 0:data.length,
            itemBuilder: (BuildContext context, int index){
              return new Container(
                  child: new Center(
                    child : new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Card(
                          child: new Container(
                            child: new Text(data[index]['name']),
                            padding :const EdgeInsets.all(10.0) 
                          )
                        )
                      ],
                    ),
                  ),
              );
            },
        )
        );
  }
}