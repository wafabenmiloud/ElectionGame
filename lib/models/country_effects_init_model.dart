// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CountryEffectsInitModel {
  final int? id;
  final String? label;
  final String? logo_path;
  final String? affected_country_data_attribute_name;
  CountryEffectsInitModel({
    required this.id,
    required this.label,
    required this.logo_path,
    required this.affected_country_data_attribute_name,
  });

  CountryEffectsInitModel copyWith({
    int? id,
    String? label,
    String? logo_path,
    String? affected_country_data_attribute_name,
  }) {
    return CountryEffectsInitModel(
      id: id ?? this.id,
      label: label ?? this.label,
      logo_path: logo_path ?? this.logo_path,
      affected_country_data_attribute_name: affected_country_data_attribute_name ?? this.affected_country_data_attribute_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'logo_path': logo_path,
      'affected_country_data_attribute_name': affected_country_data_attribute_name,
    };
  }

  factory CountryEffectsInitModel.fromMap(Map<String, dynamic> map) {
    return CountryEffectsInitModel(
      id: map['id'] as int?,
      label: map['label'] as String?,
      logo_path: map['logo_path'] as String?,
      affected_country_data_attribute_name: map['affected_country_data_attribute_name'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryEffectsInitModel.fromJson(String source) =>
      CountryEffectsInitModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CountryEffectsInitModel(id: $id, label: $label, logo_path: $logo_path, affected_country_data_attribute_name: $affected_country_data_attribute_name,)';

  @override
  bool operator ==(covariant CountryEffectsInitModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        other.logo_path == logo_path &&
        other.affected_country_data_attribute_name == affected_country_data_attribute_name;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      label.hashCode ^
      logo_path.hashCode ^
      affected_country_data_attribute_name.hashCode;
}
