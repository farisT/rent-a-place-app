import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
  home: HomePage(), 
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String url = 'http://127.0.0.1:4000/houses';

  // List for all the data
  List data;
  
  // We are defining return type here
  Future<String> getData() async {
    var res = await http.get(Uri.encodeFull(url), headers: { 'Accept': 'application/json'});
    print(res.body);
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody['results'];
      print(resBody['results'].length);
    });

    return 'Success!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RentAPlace'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                          Card(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Image.network(
                                data[index]['images'][0]
                                ),
                              ),
                          ),
                          RaisedButton(
                          onPressed: () {
                            Navigator.push(
                            context, new MaterialPageRoute(
                            builder: (context) => new SecondPage()));
                          },
                          child: Text('Interested?'),
                        ),
                      ],
                    ),
                  )
                );
              }
            )
          );
  }
  @override
  void initState() {
    super.initState();
    this.getData();
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: new Center(
            child: RaisedButton(
          onPressed: () {

          },
          child: Text('Press here'),
        )));
  }
}