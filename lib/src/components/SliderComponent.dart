import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderComponent extends StatelessWidget {
  SliderComponent({
    this.images,
  });

  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
      return images.length == 1 ? SizedBox() : CarouselSlider(
        height: 400.0,
        items: images.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 1.0),
                decoration: BoxDecoration(
                  // color: Colors.amber
                ),
                child: Image.network(image),
              );
            },
          );
        }).toList(),
      );
  }
}
