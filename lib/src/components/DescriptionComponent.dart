import 'package:first_flutter_app/src/components/SliderComponent.dart';
import 'package:first_flutter_app/src/components/TitleComponent.dart';
import 'package:flutter/material.dart';

class DescriptionComponent extends StatelessWidget {
  DescriptionComponent({
    this.description,
    this.images,
    this.features,
  });

  final List<dynamic> images;
  final List<dynamic> description;
  final List<dynamic> features;


  @override
  Widget build(BuildContext context) {
    final Iterable<Widget> textDescriptionWidgets = description.map((desc) => new Text(desc));
    final Iterable<Widget> featureDescriptionWidgets = features.map((feat) => new Text(feat));
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(child:TitleComponent(title: 'Images', text: images)),
          SliderComponent(images: images),
          TitleComponent(title: 'Description',text: description),
          ...textDescriptionWidgets,
          TitleComponent(title: 'Features',text: features),
          ...featureDescriptionWidgets,
        ]
      );
    }
}