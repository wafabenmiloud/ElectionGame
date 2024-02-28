// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PeriodConsequences {
  final int? id;
  final int? period_id;
  final String? name;
  final String? trigger_date;
  final String? json_data;
  PeriodConsequences({
    required this.id,
    required this.period_id,
    required this.name,
    required this.trigger_date,
    required this.json_data,
  });

  PeriodConsequences copyWith({
    int? id,
    int? period_id,
    String? name,
    String? trigger_date,
    String? json_data,
  }) {
    return PeriodConsequences(
      id: id ?? this.id,
      period_id: period_id ?? this.period_id,
      name: name ?? this.name,
      trigger_date: trigger_date ?? this.trigger_date,
      json_data: json_data ?? this.json_data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'period_id': period_id,
      'name': name,
      'trigger_date': trigger_date,
      'json_data': json_data,
    };
  }

  factory PeriodConsequences.fromMap(Map<String, dynamic> map) {
    return PeriodConsequences(
      id: map['id'] as int,
      period_id: map['period_id'] as int,
      name: map['name'] as String,
      trigger_date: map['trigger_date'] as String,
      json_data: map['json_data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodConsequences.fromJson(String source) =>
      PeriodConsequences.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PeriodConsequences(id: $id,  period_id: $period_id,      name: $name,trigger_date: $trigger_date,      json_data: $json_data)';

  @override
  bool operator ==(covariant PeriodConsequences other) {
    if (identical(this, other)) return true;

    return other.id == id 
    && other.period_id == period_id
    && other.name == name
    && other.trigger_date == trigger_date
    && other.json_data == json_data
    
    
    ;
  }

  @override
  int get hashCode => id.hashCode
   ^ period_id.hashCode
   ^ name.hashCode
   ^ trigger_date.hashCode
   ^ json_data.hashCode
   ;
}
