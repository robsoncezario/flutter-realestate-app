import 'dart:convert';
import './model.i18n.dart';

class Room {
  final int id;
  final String name;

  const Room({this.id,
              this.name});

  factory Room.fromJson(String str) => 
    Room.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Room.fromMap(Map<String, dynamic> json) => new Room(
    id: json['id'],
    name: json['name']);

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name
  };

  Room copyWith({
    int id,
    String name,
    String icon
  }) => new Room( 
    id: id ?? this.id,
    name: name ?? this.name);       

  String get single => this.name.i18n;    
}  