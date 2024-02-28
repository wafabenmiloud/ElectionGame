// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PresidentPromisesModel {
  final int? id;
  final int promise_id;
  final int country_id;
  final int duration_days;
  final String end_date;
  final int progress;
  final int initial_value;
  final String country_data_name;
  final int value_to_accomplished;
  final int is_accomplished;
  PresidentPromisesModel({
     this.id,
    required this.promise_id,
    required this.country_id,
    required this.duration_days,
    required this.end_date,
    required this.progress,
    required this.initial_value,
    required this.country_data_name,
    required this.value_to_accomplished,
    required this.is_accomplished,
  });

  PresidentPromisesModel copyWith({
    int? id,
    int? promise_id,
    int? country_id,
    int? duration_days,
    String? end_date,
    int? progress,
    int? initial_value,
    String? country_data_name,
    int? value_to_accomplished,
    int? is_accomplished,

  }) {
    return PresidentPromisesModel(
      id: id ?? this.id,
      promise_id: promise_id ?? this.promise_id,
      country_id: country_id ?? this.country_id,
      duration_days: duration_days ?? this.duration_days,
      end_date: end_date ?? this.end_date,
      progress: progress ?? this.progress,
      initial_value: initial_value ?? this.initial_value,
      country_data_name: country_data_name ?? this.country_data_name,
      value_to_accomplished: value_to_accomplished ?? this.value_to_accomplished,
      is_accomplished: is_accomplished ?? this.is_accomplished,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'promise_id': promise_id,
      'country_id': country_id,
      'duration_days': duration_days,
      'end_date': end_date,
      'progress': progress,
      'initial_value': initial_value,
      'country_data_name': country_data_name,
      'value_to_accomplished': value_to_accomplished,
      'is_accomplished': is_accomplished,
    };
  }

  factory PresidentPromisesModel.fromMap(Map<String, dynamic> map) {
    return PresidentPromisesModel(
      id: map['id'] as int,
      promise_id: map['promise_id'] as int,
      country_id: map['country_id'] as int,      
      duration_days: map['duration_days'] as int,
      end_date: map['end_date'] as String,
      progress: map['progress'] as int,
      initial_value: map['initial_value'] as int,
      country_data_name: map['country_data_name'] as String,
      value_to_accomplished: map['value_to_accomplished'] as int,
      is_accomplished: map['is_accomplished'] as int,

    );
  }

  String toJson() => json.encode(toMap());

  factory PresidentPromisesModel.fromJson(String source) =>
      PresidentPromisesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PresidentPromisesModel(id: $id,promise_id: $promise_id,country_id: $country_id, duration_days: $duration_days, end_date: $end_date,progress: $progress,initial_value: $initial_value,country_data_name: $country_data_name,value_to_accomplished: $value_to_accomplished,is_accomplished: $is_accomplished,)';

  @override
  bool operator ==(covariant PresidentPromisesModel other) {
    if (identical(this, other)) return true;

    return 
    other.id == id && 
    other.promise_id == promise_id && 
    other.country_id == country_id && 
    other.duration_days == duration_days && 
    other.end_date == end_date && 
    other.progress == progress && 
    other.initial_value == initial_value && 
    other.country_data_name == country_data_name && 
    other.value_to_accomplished == value_to_accomplished && 
    other.is_accomplished == is_accomplished;
  }

  @override
  int get hashCode => 
  id.hashCode ^ 
  promise_id.hashCode ^ 
  country_id.hashCode ^ 
  duration_days.hashCode ^ 
  end_date.hashCode ^ 
  progress.hashCode ^ 
  initial_value.hashCode ^ 
  country_data_name.hashCode ^ 
  value_to_accomplished.hashCode ^ 
  is_accomplished.hashCode;
}
