// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
class PresidentialAdvisorCurrentDemandModel {
  final int? id;
  final int? demand_id;
  final int? country_id;
  final String? content;
  final String? country_datas_to_check;
  final int? min_value;
  final int? max_value;
  final int? current_value;
  final int? is_accomplished;
  PresidentialAdvisorCurrentDemandModel({
    required this.id,
    required this.demand_id,
    required this.country_id,
    required this.content,
    required this.country_datas_to_check,
    
    required this.min_value,
    required this.max_value,
    required this.is_accomplished,
    required this.current_value,
  });

  PresidentialAdvisorCurrentDemandModel copyWith({
    int? id,
    int? demand_id,
    int? country_id,
    String? content,
    String? country_datas_to_check,
    int? min_value,
    int? max_value,
    int? is_accomplished,
    int? current_value,

  }) {
    return PresidentialAdvisorCurrentDemandModel(
      id: id ?? this.id,
      demand_id: demand_id ?? this.demand_id,
      country_id: country_id ?? this.country_id,
      content: content ?? this.content,
      country_datas_to_check: country_datas_to_check ?? this.country_datas_to_check,
     
      min_value: min_value ?? this.min_value,
      max_value: max_value ?? this.max_value,
      is_accomplished: is_accomplished ?? this.is_accomplished,
      current_value: current_value ?? this.current_value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'demand_id': demand_id,
      'country_id': country_id,
      'content': content,
      'country_datas_to_check': country_datas_to_check,
      
      'min_value': min_value,
      'max_value': max_value,
      'is_accomplished': is_accomplished,
      'current_value': current_value,
    };
  }

  factory PresidentialAdvisorCurrentDemandModel.fromMap(Map<String, dynamic> map) {
    return PresidentialAdvisorCurrentDemandModel(
      id: map['id'] as int?,
      demand_id: map['demand_id'] as int?,
      country_id: map['country_id'] as int?,      
      content: map['content'] as String,
      country_datas_to_check: map['country_datas_to_check'] as String?,
    
      min_value: map['min_value'] as int?,
      max_value: map['max_value'] as int?,
      is_accomplished: map['is_accomplished'] as int?,
      current_value: map['current_value'] as int?,

    );
  }

  String toJson() => json.encode(toMap());

  factory PresidentialAdvisorCurrentDemandModel.fromJson(String source) =>
      PresidentialAdvisorCurrentDemandModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PresidentialAdvisorCurrentDemandModel(id: $id,demand_id: $demand_id,country_id: $country_id, content: $content, country_datas_to_check: $country_datas_to_check,min_value: $min_value,max_value: $max_value,is_accomplished: $is_accomplished, current_value: $current_value)';

  @override
  bool operator ==(covariant PresidentialAdvisorCurrentDemandModel other) {
    if (identical(this, other)) return true;

    return 
    other.id == id && 
    other.demand_id == demand_id && 
    other.country_id == country_id && 
    other.content == content && 
    other.country_datas_to_check == country_datas_to_check && 
  
    other.min_value == min_value && 
    other.max_value == max_value && 
    other.current_value == current_value && 
    other.is_accomplished == is_accomplished;
  }

  @override
  int get hashCode => 
  id.hashCode ^ 
  demand_id.hashCode ^ 
  country_id.hashCode ^ 
  content.hashCode ^ 
  country_datas_to_check.hashCode ^ 
 
  min_value.hashCode ^ 
  max_value.hashCode ^ 
  current_value.hashCode ^ 
  is_accomplished.hashCode;
}
