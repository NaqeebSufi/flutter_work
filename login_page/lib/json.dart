import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'login.dart';
String s= email;
String so=password;

class StarWarsData extends StatefulWidget {
  @override
  StarWarsState createState() => StarWarsState();
}


class StarWarsState extends State<StarWarsData> {
 
   /* StarWarsState()
    {
        this.s=LoginPageState.email;
        this.sp=LoginPageState.password;
         print(s);
    }*/
  
 
  final String url = "https://projects.myservicesdesk.com/flutter/api/authentication.php?email="+s+"&password="+so;
  List data;
  

  Future<String> getSWData() async {
    var res = await http
.get(Uri.encodeFull(url), 
       // headers: {"Accept": "application/json"}
       );

    setState(() {
      var resBody = json.decode(res.body);

      data = resBody["orders"];
    print(res.body);
   
    
    });

    return "Success!";
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart App"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            
                            Text("Order_Id:  " +data[index]["order_id"].toString().padLeft(10, " "),
                                style: TextStyle(
                                     color: Colors.red)),
                          ],
                        )),
                  ),
                  
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Total Item:"),
                            Text(data[index]["total_items"].toString().padLeft(10, " "),
                                style: TextStyle(
                                    color: Colors.black87)),
                          ],
                        )),
                  ),
                   Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Total Price:"),
                            Text(data[index]["total_price"].toString().padLeft(10, " "),
                                style: TextStyle(
                                    color: Colors.black87)),
                          ],
                        )),
                  ),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: <Widget>[
                            Text("Order Status:"),
                            Text(data[index]["order_status"].padLeft(10, " "),
                                style: TextStyle(
                                     color: Colors.black87)),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}