import 'dart:convert';
// import 'package:flutter/material.dart';

House houseFromJson(String string) {
  final jsonData = json.decode(string);
  return House.fromJson(jsonData);
}

String houseToJson(House data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class House {
  final List images;
  final List descriptions;
  final List features;

  House({this.images, this.descriptions, this.features});

  factory House.fromJson(Map<String, dynamic> json) => House(
    images: json['images'],
    descriptions: json['description'],
    features: json['features'],
  );

  factory House.fromList(List<dynamic> list) => House(
    images: list.map((house) => house['images']).toList(),
    descriptions: list.map((house) => house['description']).toList(),
    features: list.map((house) => house['features']).toList(),
  );

  Map<String, dynamic> toJson() => {
    'images': images,
    'description': descriptions,
    'features': features,
  };
}