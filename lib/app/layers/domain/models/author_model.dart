import 'dart:convert';

class AuthorModel {
  String? id;
  String name;
  String? picture;
  int? booksCount;
  AuthorModel({
    this.id,
    required this.name,
    this.picture,
    this.booksCount,
  });

  AuthorModel copyWith({
    String? id,
    String? name,
    String? picture,
    int? booksCount,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      booksCount: booksCount ?? this.booksCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'booksCount': booksCount,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      id: map['id'],
      name: map['name'] ?? '',
      picture: map['picture'],
      booksCount: map['booksCount']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorModel(id: $id, name: $name, picture: $picture, booksCount: $booksCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorModel &&
        other.id == id &&
        other.name == name &&
        other.picture == picture &&
        other.booksCount == booksCount;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ picture.hashCode ^ booksCount.hashCode;
  }
}
