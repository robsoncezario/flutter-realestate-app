import 'dart:convert';

class RatingType {
  final int id;
  final String name;
  final String icon;

  const RatingType({this.id,
                    this.name,
                    this.icon});

  factory RatingType.fromJson(String str) => 
    RatingType.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory RatingType.fromMap(Map<String, dynamic> json) => new RatingType(
    id: json['id'],
    name: json['name'],
    icon: json['icon']);

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'icon': this.icon
  };

  RatingType copyWith({
    int id,
    String name,
    String icon
  }) => new RatingType( 
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon);           
}  