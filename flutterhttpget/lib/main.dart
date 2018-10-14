import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:intl/intl.dart';

 Map data;
 List features; // features object list
void main() async {
data = await getQuakes();

features = data['features'];

 //print(_data['features'][0]['properties']);

 runApp(new MaterialApp(
   title: 'Quakes',
   home: new Quakes(),
  ));
}

class Quakes extends StatelessWidget {
   Map data;
 List _features; 
   @override
   Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.red,
       ),
  body: new Center(
    child: new ListView.builder(
        itemCount: features.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (BuildContext context, int position) {
          //crating the rows for our listview
          if (position.isOdd) return new Divider();
          final index = position ~/
              2; // we are dividing position by 2 and returning an integer result

          var format = new DateFormat.yMMMMd("en_US").add_jm();
          //var dateString = format.format(date);
          var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(
              features[index]['properties']['time'] * 1000,
              isUtc: true));

          return new ListTile(
            title: new Text(
              " $date",
              //title: new Text("Date: $date",
              style: new TextStyle(
                  fontSize: 15.5,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: new Text(
              "${_features[index]['properties']['place']}",
              style: new TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic),
            ),
            leading: new CircleAvatar(
              backgroundColor: Colors.green,
              child: new Text(
                "${_features[index]['properties']['mag']}",
                style: new TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.normal),
              ),
            ),
            onTap: () {
              //showAlertMessage(
                  //context, "${_features[index]['properties']['title']}");
            },
          );
        }),
  ),
);
   }

   void _showAlertMessage(BuildContext context, String message) {
      var alert = new AlertDialog(
      title: new Text('Quakes'),
      content: new Text(message),
      actions: <Widget>[
           new FlatButton(
             onPressed: () {
                Navigator.pop(context);
             },
           child: new Text('OK'))
      ],
     );
  showDialog(context: context, builder: (context) => alert);
 }
}

Future<Map> getQuakes() async {
 String apiUrl = 
 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

   http.Response response = await http.get(apiUrl);

   return json.decode(response.body);
 }