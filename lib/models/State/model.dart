import 'dart:convert';

import '../City/model.dart';
import '../Country/model.dart';
import '../Photo/model.dart';
import '../Rating/model.dart';

class State {
  final int id;
  final String name;
  final List<Photo> photos;
  final List<Rating> rating;
  final Country country;
  final List<City> cities;
  final DateTime createdAt;

  const State({this.id,
               this.name,
               this.photos,
               this.rating,
               this.country,
               this.cities,
               this.createdAt});

  factory State.fromJson(String str) => 
    State.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory State.fromMap(Map<String, dynamic> json) => new State(
    id: json['id'],
    name: json['name'],
    photos: json['photos'].map((r) => Photo.fromMap(r)),
    rating: json['rating'].map((r) => Rating.fromMap(r)),
    country: Country.fromMap(json['country']),
    cities: json['cities'].map((c) => City.fromMap(c)),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'photos': this.photos.map((p) => p.toMap()),
    'rating': this.rating.map((r) => r.toMap()),
    'country': this.country.toMap(),
    'cities': this.cities.map((c) => c.toMap()),
    'createdAt': this.createdAt.toIso8601String()
  };

  State copyWith({
    int id,
    String name,
    List<Photo> photos,
    List<Rating> rating,
    State country,
    List<City> cities,
    DateTime createdAt
  }) => new State( 
    id: id ?? this.id,
    name: name ?? this.name,
    photos: photos ?? this.photos,
    rating: rating ?? this.rating,
    country: country ?? this.country,
    cities: cities ?? this.cities,
    createdAt: createdAt ?? this.createdAt);    

  double get average => 
    (rating.map((Rating r) => r.value)
           .reduce((a, b) => a + b) / rating.length) ?? 5;
}
