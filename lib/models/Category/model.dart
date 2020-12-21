import 'dart:convert';

import '../Photo/model.dart';
import '../Room/model.dart';
import './model.i18n.dart';

class Category {
  final int id;
  final String name;
  final Photo photo;
  final List<Room> rooms;
  
  const Category({this.id,
                  this.name,
                  this.photo,
                  this.rooms});

  factory Category.fromJson(String str) => 
    Category.fromMap(json.decode(str));
  String toJson() => json.encode(this.toMap());

  factory Category.fromMap(Map<String, dynamic> json) => new Category(
    id: json['id'],
    name: json['name'],
    photo: Photo.fromMap(json['photo']),
    rooms: json['rooms']?.map((r) => Room.fromMap(r)));

  Map<String, dynamic> toMap() => {
    'id': this.id,
    'name': this.name,
    'photo': this.photo.toMap(),
    'rooms': this.rooms.map((r) => r.toMap())
  };

  Category copyWith({
    int id,
    String email,
    String photo,
    List<Room> rooms
  }) => new Category( 
    id: id ?? this.id,
    name: name ?? this.name,
    photo: photo ?? this.photo,
    rooms: rooms ?? this.rooms);
  
  String get single => this.name.plural(1);
  String get plural => this.name.plural(2);
}