// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class CountryResourcesModel {
  final int? id;
  final int? country_id;
  final int? production_coifficient;
  final int? employement_level;
  final String? company_size;
  final int? number_of_companies;
  final int? licence_level;
  final int? value;
  final int? mondial_value;
  final int? total_quantity;
  final int? employee_production_per_day;
  final int? production_per_day;
  final String? name;
  final String? resources_type;
  final String? image_path;
  CountryResourcesModel({
    required this.employee_production_per_day,
    required this.production_per_day,
    required this.name,
    required this.id,
    required this.resources_type,
    required this.country_id,
    required this.image_path,
    required this.production_coifficient,
    required this.employement_level,
    required this.company_size,
    required this.number_of_companies,
    required this.licence_level,
    required this.value,
    required this.mondial_value,
    required this.total_quantity,
  });

  CountryResourcesModel copyWith({
    String? name,
    String? resources_type,
    String? image_path,
    int? id,
    int? country_id,
    int? production_coifficient,
    int? employement_level,
    String? company_size,
    int? number_of_companies,
    int? licence_level,
    int? value,
    int? mondial_value,
    int? total_quantity,
    int? employee_production_per_day,
    int? production_per_day,
  }) {
    return CountryResourcesModel(
      name: name ?? this.name,
      id: id ?? this.id,
      resources_type: resources_type ?? this.resources_type,
      image_path: image_path ?? this.image_path,
      country_id: country_id ?? this.country_id,
      production_coifficient:
          production_coifficient ?? this.production_coifficient,
      employement_level: employement_level ?? this.employement_level,
      company_size: company_size ?? this.company_size,
      number_of_companies: number_of_companies ?? this.number_of_companies,
      licence_level: licence_level ?? this.licence_level,
      value: value ?? this.value,
      mondial_value: mondial_value ?? this.mondial_value,
      total_quantity: total_quantity ?? this.total_quantity,
      employee_production_per_day: employee_production_per_day ?? this.employee_production_per_day,
      production_per_day: production_per_day ?? this.production_per_day,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'resources_type': resources_type,
      'image_path': image_path,
      'country_id': country_id,
      'production_coifficient': production_coifficient,
      'employement_level': employement_level,
      'company_size': company_size,
      'number_of_companies': number_of_companies,
      'licence_level': licence_level,
      'value': value,
      'mondial_value': mondial_value,
      'total_quantity': total_quantity,
      'employee_production_per_day': employee_production_per_day,
      'production_per_day': production_per_day,
    };
  }

  factory CountryResourcesModel.fromMap(Map<String, dynamic> map) {
    return CountryResourcesModel(
      name: map['name'] as String? ,
      resources_type: map['resources_type'] as String? ,
      image_path: map['image_path'] as String? ,
      id: map['id'] as int?,
      country_id: map['country_id'] as int?,
      production_coifficient: map['production_coifficient'] as int?,
      employement_level: map['employement_level'] as int?,
      company_size: map['company_size'] as String? ,
      number_of_companies: map['number_of_companies'] as int?,
      licence_level: map['licence_level'] as int?,
      value: map['value'] as int?,
      mondial_value: map['mondial_value'] as int?,
      total_quantity: map['total_quantity'] as int?,
      employee_production_per_day: map['employee_production_per_day'] as int?,
      production_per_day: map['production_per_day'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryResourcesModel.fromJson(String source) =>
      CountryResourcesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CountryResourcesModel(name: $name, id: $id,  resources_type: $resources_type,employee_production_per_day:$employee_production_per_day,production_per_day:$production_per_day      image_path: $image_path,      country_id: $country_id,      production_coifficient: $production_coifficient,      employement_level: $employement_level,      company_size: $company_size,      number_of_companies: $number_of_companies,      licence_level: $licence_level,      value: $value,      mondial_value: $mondial_value,      total_quantity: $total_quantity)';

  @override
  bool operator ==(covariant CountryResourcesModel other) {
    if (identical(this, other)) return true;

    return other.name == name 
    && other.id == id
    && other.resources_type == resources_type
    && other.image_path == image_path
    && other.country_id == country_id
    && other.production_coifficient == production_coifficient
    && other.employement_level == employement_level
    && other.company_size == company_size
    && other.number_of_companies == number_of_companies
    && other.licence_level == licence_level
    && other.value == value
    && other.mondial_value == mondial_value
    && other.employee_production_per_day == employee_production_per_day
    && other.production_per_day == production_per_day
    && other.total_quantity == total_quantity
    ;
  }

  @override
  int get hashCode => name.hashCode 
  ^ id.hashCode
  ^ resources_type.hashCode
  ^ image_path.hashCode
  ^ country_id.hashCode
  ^ production_coifficient.hashCode
  ^ employement_level.hashCode
  ^ company_size.hashCode
  ^ number_of_companies.hashCode
  ^ licence_level.hashCode
  ^ value.hashCode
  ^ mondial_value.hashCode
  ^ employee_production_per_day.hashCode
  ^ production_per_day.hashCode
  ^ total_quantity.hashCode
  
  
  
  ;
}
