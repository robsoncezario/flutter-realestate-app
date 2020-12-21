import 'dart:convert';

class Photo {
  final int id;
  final String src;
  final bool fromAssets;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Photo({this.id,
               this.src,
               this.fromAssets,
               this.createdAt,
               this.updatedAt});

  factory Photo.fromJson(String str) => 
    Photo.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Photo.fromMap(Map<String, dynamic> json) => new Photo(
    id: json['id'],
    src: json['src'],
    fromAssets: json['fromAssets'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'src': this.src,
    'createdAt': this.createdAt.toIso8601String(),
    'updatedAt': this.updatedAt.toIso8601String()
  };

  Photo copyWith({
    int id,
    String src,
    bool fromAssets,
    DateTime createdAt,
    DateTime updatedAt
  }) => new Photo( 
    id: id ?? this.id,
    src: src ?? this.src,
    fromAssets: fromAssets ?? this.fromAssets,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt);           
}  
