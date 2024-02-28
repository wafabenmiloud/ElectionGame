// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PoliticalPartiesModel {
  final int? id;
  final int? director_id;
  final int? country_id;
  final String name;
  final int political_direction;
  final String img_path;
  
PoliticalPartiesModel({
     this.id,
     this.country_id,
    required this.name,
     this.director_id,
    required this.political_direction,
    required this.img_path,
  });

  PoliticalPartiesModel copyWith({
    int? id,
    int? director_id,
    int? country_id,
    String? name,
    int? political_direction,
    String? img_path,
  }) {
    return PoliticalPartiesModel(
      name: name ?? this.name,
      id: id ?? this.id,
      director_id: director_id ?? this.director_id,
      country_id: country_id ?? this.country_id,
      political_direction: political_direction ?? this.political_direction,
      img_path: img_path ?? this.img_path,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'country_id': country_id,
      'director_id': director_id,
      'political_direction': political_direction,
      'img_path': img_path,
    };
  }

  factory PoliticalPartiesModel.fromMap(Map<String, dynamic> map) {
    return PoliticalPartiesModel(
      name: map['name'] as String,
      id: map['id'] as int,
      country_id: map['country_id'] as int?,
      director_id: map['director_id'] as int?,
      political_direction: map['political_direction'] as int,
      img_path: map['img_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PoliticalPartiesModel.fromJson(String source) =>
      PoliticalPartiesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PoliticalPartiesModel(name: $name, id: $id, director_id :$director_id,country_id:$country_id, political_direction :$political_direction, img_path: $img_path)';

  @override
  bool operator ==(covariant PoliticalPartiesModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.country_id == country_id &&
        other.director_id == director_id &&
        other.political_direction == political_direction &&
        other.img_path == img_path;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ director_id.hashCode ^ country_id.hashCode  ^ political_direction.hashCode ^ img_path.hashCode;
}
