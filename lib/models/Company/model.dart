import 'dart:convert';

import 'package:app/models/Location/model.dart';
import 'package:app/models/Photo/model.dart';
import 'package:app/models/Rating/model.dart';
import 'package:app/models/Customer/model.dart';

class Company {
  final int id;
  //final Business business;
  final String name;
  final List<Photo> photos;
  final List<Location> addresses;
  final List<Rating> rating;
  final List<Customer> employees;
  final DateTime updatedAt;
  final DateTime createdAt;

  const Company({this.id,
                 this.name,
                 this.photos,
                 this.addresses,
                 this.rating,
                 this.employees,
                 this.updatedAt,
                 this.createdAt});

  factory Company.fromJson(String str) => 
    Company.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Company.fromMap(Map<String, dynamic> json) => new Company(
    id : json['id'],
    name : json['name'],
    photos: json['photos'].map((p) => Photo.fromMap(p)),
    addresses: json['addresses']?.map((c) => Location.fromMap(c)),
    rating: json['rating']?.map((r) => Rating.fromMap(r)),
    employees: json['employees']?.map((r) => Customer.fromMap(r)),
    updatedAt: DateTime.parse(json['updatedAt']),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'photos': this.photos.map((p) => p.toMap()),
    'addresses': this.addresses.map((a) => a.toMap()),
    'rating': this.rating.map((r) => r.toMap()),
    'employees': this.employees.map((e) => e.toMap()),
    'updatedAt': this.updatedAt.toIso8601String(),
    'createdAt': this.createdAt.toIso8601String()
  };

  double get average => (rating
    .map((Rating r) => r.value)
    .reduce((a, b) => a + b) / rating.length) ?? 5;
}
