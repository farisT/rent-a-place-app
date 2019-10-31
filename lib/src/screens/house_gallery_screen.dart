import 'package:flutter/material.dart';
import 'package:first_flutter_app/src/components/HouseScrollView.dart';
import 'package:first_flutter_app/src/models/house_model.dart';

class HouseGalleryScreen extends StatelessWidget {
    HouseGalleryScreen({ this.house });
    
    final House house;

    @override
    Widget build(BuildContext context) {
      return HouseScrollView(
        images: house.images, 
        descriptions: house.descriptions,
        features: house.features,
      );
    }
}