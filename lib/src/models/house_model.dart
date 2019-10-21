import 'dart:convert';
import 'package:flutter/material.dart';

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

  House({@required this.images, this.descriptions, this.features});

  factory House.fromJson(Map<String, dynamic> json) => House(
    images: json['images'],
    descriptions: json['descriptions'],
    features: json['features'],
  );

  Map<String, dynamic> toJson() => {
    'images': images,
    'descriptions': descriptions,
    'features': features,
  };
}