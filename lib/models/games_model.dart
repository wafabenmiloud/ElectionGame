// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class GamesModel {
  final int? id;
  final String name_database_game;
  final int my_country_id;
  final int points;
  final String current_date;
  GamesModel({
    this.id,
    required this.name_database_game,
    required this.my_country_id,
    required this.points,
    required this.current_date,
  });

  GamesModel copyWith({
    int? id,
    String? name_database_game,
    int? my_country_id,
    int? points,
    String? current_date,
  }) {
    return GamesModel(
      id: id ?? this.id,
      name_database_game: name_database_game ?? this.name_database_game,
      my_country_id: my_country_id ?? this.my_country_id,
      points: points ?? this.points,
      current_date: current_date ?? this.current_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_database_game': name_database_game,
      'my_country_id': my_country_id,
      'points': points,
      'current_date': current_date,
    };
  }

  factory GamesModel.fromMap(Map<String, dynamic> map) {
    return GamesModel(
      id: map['id'] != null ? map['id'] as int : null,
      name_database_game: map['name_database_game'] as String,
      my_country_id: map['my_country_id'] as int,
      points: map['points'] as int,
      current_date: map['current_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GamesModel.fromJson(String source) =>
      GamesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GamesModel(id: $id, name_database_game: $name_database_game, my_country_id: $my_country_id, points: $points, current_date: $current_date)';
  }

  @override
  bool operator ==(covariant GamesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name_database_game == name_database_game &&
        other.my_country_id == my_country_id &&
        other.points == points &&
        other.current_date == current_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name_database_game.hashCode ^
        my_country_id.hashCode ^
        points.hashCode ^
        current_date.hashCode;
  }
}
