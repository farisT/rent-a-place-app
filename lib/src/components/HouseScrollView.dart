import 'package:first_flutter_app/src/components/LinkViewButton.dart';
import 'package:first_flutter_app/src/screens/view_house_screen.dart';
import 'package:flutter/material.dart';

class HouseScrollView extends StatelessWidget {
  HouseScrollView({
    this.images,
    this.descriptions,
    this.features
  });
  final List images;
  final List descriptions;
  final List features;

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                          Card(
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              child: Image.network(
                                images[index][0]
                                ),
                              ),
                          ),
                          LinkViewButton(
                            houseViewPage: 
                            ViewHouseScreen(
                                  houseInfo: descriptions[index],
                                  images: images[index], 
                                  features: features[index]
                            )
                          ),
                      ],
                    ),
                  )
                );
              }
            );
    }
}