// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class PeriodTriggers {
  final int? id;
  final int? country_id_to_check;
  final int? period_id_to_run;
  final int? min_value;
  final int? max_value;
  final int? values_trigger;
  final String? country_datas_to_check;
  final String? country_relationship_to_check;
  final String? country_diplomatie;
  PeriodTriggers({
    required this.id,
    required this.country_id_to_check,
    required this.period_id_to_run,
    required this.min_value,
    required this.max_value,
    required this.values_trigger,
  
    required this.country_datas_to_check,
    required this.country_relationship_to_check,
    required this.country_diplomatie,
  });

  PeriodTriggers copyWith({
    int? id,
    int? country_id_to_check,
    int? period_id_to_run,
    int? min_value,
    int? max_value,
    int? values_trigger,
 
    String? country_datas_to_check,
    String? country_relationship_to_check,
    String? country_diplomatie,
  }) {
    return PeriodTriggers(
      id: id ?? this.id,
      country_id_to_check: country_id_to_check ?? this.country_id_to_check,
      period_id_to_run: period_id_to_run ?? this.period_id_to_run,
      min_value: min_value ?? this.min_value,
      max_value: max_value ?? this.max_value,
      values_trigger: values_trigger ?? this.values_trigger,
   
      country_datas_to_check: country_datas_to_check ?? this.country_datas_to_check,
      country_relationship_to_check: country_relationship_to_check ?? this.country_relationship_to_check,
      country_diplomatie: country_diplomatie ?? this.country_diplomatie,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_id_to_check': country_id_to_check,
      'period_id_to_run': period_id_to_run,
      'min_value': min_value,
      'max_value': max_value,
      'values_trigger': values_trigger,
     
      'country_datas_to_check': country_datas_to_check,
      'country_relationship_to_check': country_relationship_to_check,
      'country_diplomatie': country_diplomatie,
    };
  }

  factory PeriodTriggers.fromMap(Map<String, dynamic> map) {
    return PeriodTriggers(
      id: map['id'] as int?,
      country_id_to_check: map['country_id_to_check'] as int?,
      period_id_to_run: map['period_id_to_run'] as int?,
      min_value: map['min_value'] as int?,
      max_value: map['max_value'] as int?,
      values_trigger: map['values_trigger'] as int?,
    
      country_datas_to_check: map['country_datas_to_check'] as String?,
      country_relationship_to_check: map['country_relationship_to_check'] as String?,
      country_diplomatie: map['country_diplomatie'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodTriggers.fromJson(String source) =>
      PeriodTriggers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PeriodTriggers(id: $id, country_id_to_check: $country_id_to_check, country_diplomatie:$country_diplomatie    period_id_to_run: $period_id_to_run,      min_value: $min_value,      max_value: $max_value,      values_trigger: $values_trigger,           country_datas_to_check: $country_datas_to_check,      country_relationship_to_check: $country_relationship_to_check,)';

  @override
  bool operator ==(covariant PeriodTriggers other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.country_id_to_check == country_id_to_check &&
        other.period_id_to_run == period_id_to_run &&
        other.min_value == min_value &&
        other.max_value == max_value &&
        other.values_trigger == values_trigger &&
      
        other.country_datas_to_check == country_datas_to_check &&
        other.country_diplomatie == country_diplomatie &&
        other.country_relationship_to_check == country_relationship_to_check;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      country_id_to_check.hashCode ^
      period_id_to_run.hashCode ^
      min_value.hashCode ^
      max_value.hashCode ^
      values_trigger.hashCode ^
    
      country_datas_to_check.hashCode ^
      country_diplomatie.hashCode ^
      country_relationship_to_check.hashCode;
}
