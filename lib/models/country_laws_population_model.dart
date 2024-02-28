// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CountryLawsPopulationModel {
  final int id;
  final int law_id;
  final int population_id;
  final String relation_type;
  CountryLawsPopulationModel({
    required this.id,
    required this.law_id,
    required this.population_id,
    required this.relation_type,
  });

  CountryLawsPopulationModel copyWith({
    int? id,
    int? law_id,
    int? population_id,
    String? relation_type,
  }) {
    return CountryLawsPopulationModel(
      id: id ?? this.id,
      law_id: law_id ?? this.law_id,
      population_id: population_id ?? this.population_id,
      relation_type: relation_type ?? this.relation_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'law_id': law_id,
      'population_id': population_id,
      'relation_type': relation_type,
    };
  }

  factory CountryLawsPopulationModel.fromMap(Map<String, dynamic> map) {
    return CountryLawsPopulationModel(
      id: map['id'] as int,
      law_id: map['law_id'] as int,
      population_id: map['population_id'] as int,
      relation_type: map['relation_type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryLawsPopulationModel.fromJson(String source) =>
      CountryLawsPopulationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CountryLawsPopulationModel(id: $id, law_id: $law_id,population_id:$population_id,          relation_type: $relation_type)';

  @override
  bool operator ==(covariant CountryLawsPopulationModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.law_id == law_id &&
        other.population_id == population_id &&
        other.relation_type == relation_type ;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      law_id.hashCode ^
      population_id.hashCode ^
      relation_type.hashCode;
}
