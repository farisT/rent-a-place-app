
class Util {
  static List<dynamic> filterDescription(List<dynamic> description) {
    if(description.isEmpty) {
      description.add('No description available');
      return description;
    } else return description;
  }
  static List<List<dynamic>> cleanData(List data) {
    var rawImages = data.map((house) => house['images']);
    final List images = rawImages.where((image) => !image.isEmpty ).toList();
    final List features = data.map((house) => house['features']).toList();
    final List descriptions = data.map((house) => house['description']).toList();
    return [images, features, descriptions];
  }
}
