import 'dart:convert';

import 'package:app/models/Photo/model.dart';
import 'package:app/models/Rating/model.dart';
import 'package:app/models/State/model.dart';

class Country {
  final int id;
  final String name;
  final String code;
  final List<Photo> photos;
  final List<Rating> rating;
  final List<State> states;
  final DateTime createdAt;

  const Country({this.id,
                 this.name,
                 this.code,
                 this.photos,
                 this.rating,
                 this.states,
                 this.createdAt});

  factory Country.fromJson(String str) => 
    Country.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Country.fromMap(Map<String, dynamic> json) => new Country(
    id: json['id'],
    name: json['name'],
    code: json['code'],
    photos: json['photos'].map((p) => Photo.fromMap(p)),
    rating: json['rating'].map((r) => Rating.fromMap(r)),
    states: json['states'].map((s) => State.fromMap(s)),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'code': this.code,
    'photos': this.photos.map((p) => p.toMap()),
    'rating': this.rating.map((r) => r.toMap()),
    'states': this.states.map((s) => s.toMap()),
    'createdAt': this.createdAt.toIso8601String()
  };

  Country copyWith({
    int id,
    String name,
    String code,
    List<Photo> photos,
    List<Rating> rating,
    State states,
    DateTime createdAt
  }) => new Country( 
    id: id ?? this.id,
    name: name ?? this.name,
    code: code ?? this.code,
    photos: photos ?? this.photos,
    rating: rating ?? this.rating,
    states: states ?? this.states,
    createdAt: createdAt ?? this.createdAt);    

  double get average => 
    (rating.map((Rating r) => r.value)
           .reduce((a, b) => a + b) / rating.length) ?? 5;
}