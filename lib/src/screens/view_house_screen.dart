import 'package:first_flutter_app/src/components/DescriptionComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewHouseScreen extends StatelessWidget {
  ViewHouseScreen({
    this.description,
    this.images,
    this.features,
  });
  final List description;
  final List images;
  final List features;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('House Info'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body:  SingleChildScrollView(
            child: DescriptionComponent(description: description,images: images, features: features)
          )
    );
  }
}