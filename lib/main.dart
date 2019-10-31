import 'package:first_flutter_app/src/models/house_model.dart';
import 'package:first_flutter_app/src/screens/home_screen.dart';
import 'package:first_flutter_app/src/screens/house_gallery_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(
  MaterialApp(home: HomePage(), 
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final String url = 'http://127.0.0.1:4000/houses';
  // List for all the data
  List data;
  House houseData;
   int _currentIndex = 0;
  // final List<Widget> _children = [
  //   HomeScreen(),
    // HouseGalleryScreen(house),
  // ];
  // We are defining return type here
  Future<String> getData() async {
    var res = await http.get(Uri.encodeFull(url), headers: { 'Accept': 'application/json'});
    setState(() {
      var resBody = json.decode(res.body);
      data = resBody['results'];
      houseData = House.fromList(resBody['results']);
    });
    return 'Success!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RentAHome'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: [HomeScreen(), HouseGalleryScreen(house: houseData)][_currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
         new BottomNavigationBarItem(
           icon: Icon(Icons.dashboard),
           title: Text('Dashboard'),
         ),
         new BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text('House gallery'),
         ),
        //  new BottomNavigationBarItem(
        //    icon: Icon(Icons.person),
        //    title: Text('Profile')
        //  )
       ],
     ),
    );
  }

  // HouseGalleryScreen(house: houseData)

void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
  @override
  void initState() {
    super.initState();
    this.getData();
  }
}

