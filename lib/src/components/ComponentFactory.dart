import 'package:first_flutter_app/main.dart';
import 'package:first_flutter_app/src/components/LinkViewButton.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ComponentFactory {
  static Widget buildDescription(BuildContext context, List<dynamic> description, List<dynamic> images, List<dynamic> features) {
    if(description.length == 1 && images.length > 1 ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Images', 
          style: DefaultTextStyle.of(context).style.apply(
                color: Colors.deepPurpleAccent, 
                fontSizeFactor: 1.0,
              )
            ),
          buildSlider(context, images)
        ]
      );
    }
    else if(description.length > 1 && images != null) {
      final Iterable<Widget> textWidgets = description.map((desc) => new Text(desc));
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Description', 
          style: DefaultTextStyle.of(context).style.apply(
                color: Colors.deepPurpleAccent, 
                fontSizeFactor: 1.0,
              )
            ),
          SizedBox(height: 10),
          ...textWidgets,
          Text('Images', 
          style: DefaultTextStyle.of(context).style.apply(
                color: Colors.deepPurpleAccent, 
                fontSizeFactor: 1.0,
              )
            ),
          buildSlider(context, images)
        ]
      );
    }
    else if(description.length > 1 && images.length == 1) {
      final Iterable<Widget> textWidgets = description.map((desc) => new Text(desc));
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Description', 
          style: DefaultTextStyle.of(context).style.apply(
                color: Colors.deepPurpleAccent, 
                fontSizeFactor: 1.0,
              )
            ),
          SizedBox(height: 10),
          ...textWidgets,
        ]
      );
    }
    else if(description.length == 1 && images.length == 1) {
      return Text(
        description[0]
      );
    }
}
  static Widget buildSlider(BuildContext context, List images) {
    return CarouselSlider(
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
  static Widget houseViewer(BuildContext context, List images, List descriptions, List features) {
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
                            ViewHouseWidget(
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
