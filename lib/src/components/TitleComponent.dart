import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  TitleComponent({
    this.title,
    this.text
  });

  final String title;
  final List text;

  @override
  Widget build(BuildContext context) {
      return text.isEmpty ? Text(title, 
            style: DefaultTextStyle.of(context).style.apply(
                color: Colors.deepPurpleAccent, 
                fontSizeFactor: 1.0,
            )
      ): SizedBox();
    }
}