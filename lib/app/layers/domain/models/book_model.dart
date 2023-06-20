import 'dart:convert';

import 'package:flutter_challenge_books/app/layers/domain/models/author_model.dart';

class BookModel {
  String id;
  String name;
  String cover;
  String? description;
  AuthorModel author;
  BookModel({
    required this.id,
    required this.name,
    required this.cover,
    this.description,
    required this.author,
  });

  BookModel copyWith({
    String? id,
    String? name,
    String? cover,
    String? description,
    AuthorModel? author,
  }) {
    return BookModel(
      id: id ?? this.id,
      name: name ?? this.name,
      cover: cover ?? this.cover,
      description: description ?? this.description,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cover': cover,
      'description': description,
      'author': author.toMap(),
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      cover: map['cover'] ?? '',
      description: map['description'],
      author: AuthorModel.fromMap(map['author']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookModel(id: $id, name: $name, cover: $cover, description: $description, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.id == id &&
        other.name == name &&
        other.cover == cover &&
        other.description == description &&
        other.author == author;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        cover.hashCode ^
        description.hashCode ^
        author.hashCode;
  }
}
