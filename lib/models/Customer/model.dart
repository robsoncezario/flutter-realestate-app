import 'dart:convert';

import 'package:app/models/Location/model.dart';
import 'package:app/models/Photo/model.dart';
import 'package:app/models/Rating/model.dart';

class Customer {
  final int id;
  final String email;
  final String name;
  final DateTime birthDate;
  final Photo photo;
  final List<Location> addresses;
  final List<Rating> rating;
  //final List<Company> companies;
  final DateTime updatedAt;
  final DateTime createdAt;

  const Customer({this.id,
                  this.email,
                  this.name,
                  this.birthDate,
                  this.photo,
                  this.addresses,
                  this.rating,
                  //this.companies,
                  this.updatedAt,
                  this.createdAt});

  factory Customer.fromJson(String str) => 
    Customer.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Customer.fromMap(Map<String, dynamic> json) => new Customer(
    id: json['id'],
    email: json['email'],
    name: json['name'],
    photo: Photo.fromMap(json['photos']),
    addresses: json['addresses'].map((c) => Location.fromMap(c)),
    rating: json['rating'].map((r) => Rating.fromMap(r)),
    updatedAt: DateTime.parse(json['updatedAt']),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'email': this.email,
    'name': this.name,
    'photo': this.photo.toMap(),
    'addresses': this.addresses.map((a) => a.toMap()),
    'rating': this.rating.map((r) => r.toMap()),
    'updatedAt': this.updatedAt.toIso8601String(),
    'createdAt': this.createdAt.toIso8601String()
  };

  Customer copyWith({
    int id,
    String email,
    String name,
    Photo photo,
    List<Rating> rating,
    List<Location> addresses,
    DateTime updatedAt,
    DateTime createdAt
  }) => new Customer( 
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    photo: photo ?? this.photo,
    rating: rating ?? this.rating,
    addresses: addresses ?? this.addresses,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt);    

  double get average => (rating
    .map((Rating r) => r.value)
    .reduce((a, b) => a + b) / rating.length) ?? 5;

  int get age => ((new DateTime
    .now()
    .difference(birthDate)
    .inDays) / 365.25)
    .round();

  Location get location => this?.addresses?.first;
  // Location get location => this?.addresses?.first ?? this?.companies?.first?.address  
}
