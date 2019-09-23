import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './src/components/ComponentFactory.dart';
import './src/util/util.dart';

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
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody['results'];
    });
    return 'Success!';
  }

  String checkImage(String apiImage) {
  if (apiImage == null) {
    return 'https://c8.alamy.com/comp/EPF1YW/nun-with-handgun-isolated-on-white-EPF1YW.jpg';
  } else {
    return apiImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RentAPlace'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: MyScaffold(data: data)
      );
  }


  @override
  void initState() {
    super.initState();
    this.getData();

  }
}


class MyScaffold extends StatelessWidget {
    MyScaffold({ this.data });
    
    final List data;
    Widget build(BuildContext context) {
      // filter empty images to make sure we dont get any errors building the ListView
      // Util.cleanData returns an array with the new data images,descriptions, features
      final cleanedData = Util.cleanData(data);
      final images = cleanedData[0];
      final descriptions = cleanedData[1];
      final features = cleanedData[2];

      return ComponentFactory.houseViewer(context, images, descriptions, features);
    }
}

class ViewHouseWidget extends StatelessWidget {
  ViewHouseWidget({
    this.houseInfo,
    this.images,
    this.features,
  });
  final List houseInfo;
  final List images;
  final List features;

  @override
  Widget build(BuildContext context) {
    final description = Util.filterDescription(houseInfo);
    return Scaffold(
        appBar: AppBar(
          title: Text('House Info'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body:  ComponentFactory.buildDescription(context, description, images, features)
    );
  }
}