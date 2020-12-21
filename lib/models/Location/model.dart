import 'dart:convert';

import 'package:app/models/Neighborhood/model.dart';
import 'package:app/models/City/model.dart';
import 'package:app/models/State/model.dart';
import 'package:app/models/Country/model.dart';

class Location {
  final int id;
  final double latitude;
  final double longitude;
  final String postalCode;
  final String feature;
  final String street;
  final Neighborhood neighborhood;
  final City city;
  final State state;
  final Country country;
  final DateTime createdAt;

  const Location({this.id,
                  this.latitude,
                  this.longitude,
                  this.postalCode,
                  this.feature,
                  this.street,
                  this.neighborhood,
                  this.city,
                  this.state,
                  this.country,
                  this.createdAt});

  factory Location.fromJson(String str) => 
    Location.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Location.fromMap(Map<String, dynamic> json) => new Location(
    id: json['id'],
    latitude: json['latitude'],
    longitude: json['longitude'],
    postalCode: json['postalCode'],
    feature: json['feature'],
    street: json['street'],
    neighborhood: Neighborhood.fromMap(json['neighborhood']),
    city: City.fromMap(json['city']),
    state: State.fromMap(json['state']),
    country: Country.fromMap(json['country']),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'latitude': this.latitude,
    'longitude': this.longitude,
    'postalCode': this.postalCode,
    'feature': this.feature,
    'street': this.street,
    'neighborhood': this.neighborhood.toMap(),
    'city': this.city.toMap(),
    'state': this.state.toMap(),
    'country': this.country.toMap(),
    'createdAt': this.createdAt.toIso8601String()
  };

  Location copyWith({
    int id,
    double latitude,
    double longitude,
    String postalCode,
    String feature,
    String street,
    Neighborhood neighborhood,
    City city,
    State state,
    Country country,
    DateTime createdAt
  }) => new Location( 
    id: id ?? this.id,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    postalCode: postalCode ?? this.postalCode,
    feature: feature ?? this.feature,
    street: street ?? this.street,
    neighborhood: neighborhood ?? this.neighborhood,
    city: city ?? this.city,
    state: state ?? this.state,
    country: country ?? this.country,
    createdAt: createdAt ?? this.createdAt);
}
