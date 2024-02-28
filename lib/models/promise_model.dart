// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'dart:convert';

class PromiseModel {
  final int id;
  final int duration_days;
  final String content;
  final int level;
  final int political_direction;
  final String ideology;
  PromiseModel({
    required this.id,
    required this.duration_days,
    required this.content,
    required this.level,
    required this.political_direction,
    required this.ideology,
  });

  PromiseModel copyWith({
    int? id,
    int? duration_days,
    String? content,
    int? level,
    int? political_direction,
    String? ideology,
  }) {
    return PromiseModel(
      id: id ?? this.id,
      duration_days: duration_days ?? this.duration_days,
      content: content ?? this.content,
      level: level ?? this.level,
      political_direction: political_direction ?? this.political_direction,
      ideology: ideology ?? this.ideology,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'duration_days': duration_days,
      'content': content,
      'level': level,
      'political_direction': political_direction,
      'ideology': ideology,
    };
  }

  factory PromiseModel.fromMap(Map<String, dynamic> map) {
    return PromiseModel(
      id: map['id'] as int,
      duration_days: map['duration_days'] as int,
      content: map['content'] as String,
      level: map['level'] as int,
      political_direction: map['political_direction'] as int,
      ideology: map['ideology'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PromiseModel.fromJson(String source) =>
      PromiseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PromiseModel(id: $id,duration_days: $duration_days,content: $content,level: $level, political_direction: $political_direction, ideology: $ideology)';

  @override
  bool operator ==(covariant PromiseModel other) {
    if (identical(this, other)) return true;

    return 
    other.id == id && 
    other.duration_days == duration_days && 
    other.content == content && 
    other.level == level && 
    other.political_direction == political_direction && 
    other.ideology == ideology;
  }

  @override
  int get hashCode => 
  id.hashCode ^ 
  duration_days.hashCode ^ 
  content.hashCode ^ 
  level.hashCode ^ 
  political_direction.hashCode ^ 
  ideology.hashCode;
}
