
import 'package:first_flutter_app/src/models/house_model.dart';

class Util {
  static List<dynamic> filterDescription(List<dynamic> description) {
    if(description.isEmpty) {
      description.add('No description available');
      return description;
    } else return description;
  }
  
  // implemented on House class so not necessary anymore
  static House cleanData(List data) {
    var rawImages = data.map((house) => house['images']);
    final List images = rawImages.where((image) => !image.isEmpty ).toList();
    final List features = data.map((house) => house['features']).toList();
    final List descriptions = data.map((house) => house['description']).toList();
    return House(images: images, descriptions: descriptions, features: features);
  }
}
