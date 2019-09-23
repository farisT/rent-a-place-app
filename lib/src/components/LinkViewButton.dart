import 'package:flutter/material.dart';

class LinkViewButton extends StatelessWidget {
      LinkViewButton({ this.houseViewPage });
      final Widget houseViewPage;

      Widget build(BuildContext context) {
        return RaisedButton(
          child: Text(
            'Details',
            style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Colors.deepPurpleAccent,
          onPressed: () {
            Navigator.push(
            context, new MaterialPageRoute(
            builder: (context) => houseViewPage
              )
            );
          },
          padding: EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 10.0), // gives padding to the button
      );
    }
}