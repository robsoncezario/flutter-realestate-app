import 'dart:convert';

import 'package:app/models/Neighborhood/model.dart';
import 'package:app/models/Photo/model.dart';
import 'package:app/models/Rating/model.dart';
import 'package:app/models/State/model.dart';

class City {
  final int id;
  final String name;
  final List<Photo> photos;
  final List<Rating> rating;
  final State state;
  final List<Neighborhood> neighborhoodies;
  final DateTime createdAt;

  const City({this.id,
              this.name,
              this.photos,
              this.rating,
              this.state,
              this.neighborhoodies,
              this.createdAt});

  factory City.fromJson(String str) => 
    City.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory City.fromMap(Map<String, dynamic> json) => new City(
    id: json['id'],
    name: json['name'],
    photos: json['photos'].map((r) => Photo.fromMap(r)),
    rating: json['rating'].map((r) => Neighborhood.fromMap(r)),
    state: State.fromMap(json['state']),
    neighborhoodies: json['neighborhoodies'].map((n) => Neighborhood.fromMap(n)),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'photos': this.photos.map((p) => p.toMap()),
    'rating': this.rating.map((r) => r.toMap()),
    'state': this.state.toMap(),
    'neighborhoodies': this.neighborhoodies.map((n) => n.toMap()),
    'createdAt': this.createdAt.toIso8601String()
  };

  City copyWith({
    int id,
    String name,
    List<Photo> photos,
    List<Rating> rating,
    State state,
    List<Neighborhood> neighborhoodies,
    DateTime createdAt
  }) => new City( 
    id: id ?? this.id,
    name: name ?? this.name,
    photos: photos ?? this.photos,
    rating: rating ?? this.rating,
    state: state ?? this.state,
    neighborhoodies: neighborhoodies ?? this.neighborhoodies,
    createdAt: createdAt ?? this.createdAt);    

  double get average => 
    (rating.map((Rating r) => r.value)
           .reduce((a, b) => a + b) / rating.length) ?? 5;
}
