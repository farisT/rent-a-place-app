import 'package:first_flutter_app/src/components/ComponentFactory.dart';
import 'package:first_flutter_app/src/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewHouseScreen extends StatelessWidget {
  ViewHouseScreen({
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