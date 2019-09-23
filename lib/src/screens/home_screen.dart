// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {
//   final String url = 'http://127.0.0.1:4000/houses';
//   // List for all the data
//   List data;
  
//   // We are defining return type here
//   Future<String> getData() async {
//     var res = await http.get(Uri.encodeFull(url), headers: { 'Accept': 'application/json'});
//     setState(() {
//       var resBody = json.decode(res.body);
//       data = resBody['results'];
//     });
//     return 'Success!';
//   }

//   String checkImage(String apiImage) {
//   if (apiImage == null) {
//     return 'https://c8.alamy.com/comp/EPF1YW/nun-with-handgun-isolated-on-white-EPF1YW.jpg';
//   } else {
//     return apiImage;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('RentAPlace'),
//           backgroundColor: Colors.deepPurpleAccent,
//         ),
//         body: MyScaffold(data: data)
//       );
//   }


//   @override
//   void initState() {
//     super.initState();
//     this.getData();

//   }
// }