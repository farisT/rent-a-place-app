import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  TitleComponent({
    this.title,
    this.text
  });

  final String title;
  final List<dynamic> text;

  @override
  Widget build(BuildContext context) {
      return text.length > 1 ? Text(title, 
              style: TextStyle(
              fontSize: 35.0,
              height: 2,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent
      )): SizedBox();
    }
}
