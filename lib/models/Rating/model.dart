import 'dart:convert';

import 'package:app/models/RatingType/model.dart';

class Rating {
  final RatingType rating;
  final double value;
  final DateTime updatedAt;
  final DateTime createdAt;

  const Rating({this.rating,
                this.value,
                this.updatedAt,
                this.createdAt});

  factory Rating.fromJson(String str) => 
    Rating.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Rating.fromMap(Map<String, dynamic> json) => new Rating(
    rating: RatingType.fromMap(json['rating']),
    value: json['value'],
    updatedAt: DateTime.parse(json['updatedAt']),
    createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toMap() => {
    'rating': this.rating.toMap(),
    'value': this.value,
    'updatedAt': this.updatedAt.toIso8601String(),
    'createdAt': this.createdAt.toIso8601String()
  };

  Rating copyWith({
    RatingType rating,
    double value,
    DateTime updatedAt,
    DateTime createdAt
  }) => new Rating( 
    rating: rating ?? this.rating,
    value: value ?? this.value,
    updatedAt: updatedAt ?? this.updatedAt);           
}  
