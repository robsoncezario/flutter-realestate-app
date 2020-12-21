import 'dart:convert';

import 'package:app/models/City/model.dart';
import 'package:app/models/Photo/model.dart';
import 'package:app/models/Rating/model.dart';

class Neighborhood {
  final int id;
  final String name;
  final List<Photo> photos;
  final List<Rating> rating;
  final City city;
  final DateTime createdAt;

  const Neighborhood({this.id,
                      this.name,
                      this.photos,
                      this.rating,
                      this.city,
                      this.createdAt});
  
  factory Neighborhood.fromJson(String str) => 
    Neighborhood.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Neighborhood.fromMap(Map<String, dynamic> json) => new Neighborhood(
    id: json['id'],
    name: json['name'],
    photos: json['photos'].map((r) => Photo.fromMap(r)),
    rating: json['rating'].map((r) => Neighborhood.fromMap(r)),
    city: City.fromMap(json['city']),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'photos': this.photos.map((p) => p.toMap()),
    'rating': this.rating.map((r) => r.toMap()),
    'city': this.city.toMap(),
    'createdAt': this.createdAt.toIso8601String()
  };

  Neighborhood copyWith({
    int id,
    String name,
    List<Photo> photos,
    List<Rating> rating,
    City city,
    DateTime createdAt
  }) => new Neighborhood( 
    id: id ?? this.id,
    name: name ?? this.name,
    photos: photos ?? this.photos,
    rating: rating ?? this.rating,
    city: city ?? this.city,
    createdAt: createdAt ?? this.createdAt);   

  double get average => 
    (rating.map((Rating r) => r.value)
           .reduce((a, b) => a + b) / rating.length) ?? 5;
}
