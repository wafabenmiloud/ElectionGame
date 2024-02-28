// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class PeriodsModel {
  final int id;
  final int country_id;

  final String name;
  final String category_type;
  final String trigger_type;
  final String level;
  final String start_date;
  final String end_date;

  PeriodsModel(
      {required this.id,
      required this.name,
      required this.category_type,
      required this.trigger_type,
      required this.level,
      required this.start_date,
      required this.end_date,
      required this.country_id,
     
    });

  PeriodsModel copyWith(
      {int? id,
      String? name,
      String? category_type,
      String? trigger_type,
      String? level,
      String? start_date,
      String? end_date,
      int? country_id,
    
    }) {
    return PeriodsModel(
      id: id ?? this.id,
      name:
          name ?? this.name,
      category_type: category_type ?? this.category_type,
      trigger_type: trigger_type ?? this.trigger_type,
      level: level ?? this.level,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      country_id: country_id ?? this.country_id,
    
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category_type': category_type,
      'trigger_type': trigger_type,
      'level': level,
      'start_date': start_date,
      'end_date': end_date,
      'country_id': country_id,
    
    
    };
  }

  factory PeriodsModel.fromMap(Map<String, dynamic> map) {
    return PeriodsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      category_type: map['category_type'] as String,
      trigger_type: map['trigger_type'] as String,
      level: map['level'] as String,
      start_date: map['start_date'] as String,
      end_date: map['end_date'] as String,
      country_id: map['country_id'] as int,
    
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodsModel.fromJson(String source) =>
      PeriodsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PeriodsModel(id: $id, name: $name, category_type: $category_type, trigger_type: $trigger_type, level: $level, start_date: $start_date, end_date :$end_date,country_id:$country_id)';
  }

  @override
  bool operator ==(covariant PeriodsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.category_type == category_type &&
        other.trigger_type == trigger_type &&
        other.level == level &&
        other.start_date == start_date &&
        other.end_date == end_date &&
        other.country_id == country_id ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        category_type.hashCode ^
        trigger_type.hashCode ^
        level.hashCode ^
        start_date.hashCode ^
        end_date.hashCode ^
        country_id.hashCode ;
  }
}
