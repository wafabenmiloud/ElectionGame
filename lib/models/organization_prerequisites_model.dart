// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class OrganizationPrerequisitesModel {
  final int? id;  
  final int? organization_id;
  final String continent_name;
  final int? min_population_number;
  final int? min_median_salary;
  final int? max_pollution_taux;
  final int? min_security_taux;
  final int? min_total_economy_amount;
  final int? min_stability_int_taux;
  final int? min_stability_international_taux;
  final int? min_pib_amount;
  final int? min_military_number;
  OrganizationPrerequisitesModel(
      {required this.id,
      required this.continent_name,
      required this.organization_id,
      required this.min_population_number,
      required this.min_median_salary,
      required this.max_pollution_taux,
      required this.min_security_taux,
      required this.min_total_economy_amount,
      required this.min_stability_int_taux,
      required this.min_stability_international_taux,
      required this.min_pib_amount,
      required this.min_military_number,
     });

  OrganizationPrerequisitesModel copyWith(
      {int? id,
      int? organization_id,
      String? continent_name,
      int? min_population_number,
      int? min_median_salary,
      int? max_pollution_taux,
      int? min_security_taux,
      int? min_total_economy_amount,
      int? min_stability_int_taux,
      int? min_stability_international_taux,
      int? min_pib_amount,
      int? min_military_number,
      }) {
    return OrganizationPrerequisitesModel(
      id: id ?? this.id,
      organization_id: organization_id ?? this.organization_id,
      min_population_number: min_population_number ?? this.min_population_number,
      min_median_salary: min_median_salary ?? this.min_median_salary,
      max_pollution_taux: max_pollution_taux ?? this.max_pollution_taux,
      min_security_taux: min_security_taux ?? this.min_security_taux,
      continent_name: continent_name ?? this.continent_name,
      min_total_economy_amount: min_total_economy_amount ?? this.min_total_economy_amount,
      min_stability_int_taux: min_stability_int_taux ?? this.min_stability_int_taux,
      min_stability_international_taux:
      min_stability_international_taux ?? this.min_stability_international_taux,
      min_pib_amount: min_pib_amount ?? this.min_pib_amount,
      min_military_number: min_military_number ?? this.min_military_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'organization_id': organization_id,
      'min_population_number': min_population_number,
      'min_median_salary': min_median_salary,
      'max_pollution_taux': max_pollution_taux,
      'min_security_taux': min_security_taux,
      'continent_name': continent_name,
      'min_total_economy_amount': min_total_economy_amount,
      'min_stability_int_taux': min_stability_int_taux,
      'min_stability_international_taux': min_stability_international_taux,
      'min_pib_amount': min_pib_amount,
      'min_military_number': min_military_number,
    };
  }

  factory OrganizationPrerequisitesModel.fromMap(Map<String, dynamic> map) {
    return OrganizationPrerequisitesModel(
      id: map['id'] != null ? map['id'] as int : null,
      continent_name: map['continent_name'] != null ? map['continent_name'] as String : '',
      organization_id: map['organization_id'] != null ? map['organization_id'] as int : null,
      min_population_number: map['min_population_number'] != null
          ? map['min_population_number'] as int
          : null,
      min_median_salary:
          map['min_median_salary'] != null ? map['min_median_salary'] as int : null,
      max_pollution_taux:
          map['max_pollution_taux'] != null ? map['max_pollution_taux'] as int : null,
      min_security_taux:
          map['min_security_taux'] != null ? map['min_security_taux'] as int : null,
    min_total_economy_amount: map['min_total_economy_amount'] != null
          ? map['min_total_economy_amount'] as int
          : null,
      min_stability_int_taux: map['min_stability_int_taux'] != null
          ? map['min_stability_int_taux'] as int
          : null,
      min_stability_international_taux: map['min_stability_international_taux'] != null
          ? map['min_stability_international_taux'] as int
          : null,
    
      min_pib_amount: map['min_pib_amount'] != null ? map['min_pib_amount'] as int : null,
      min_military_number:
          map['min_military_number'] != null ? map['min_military_number'] as int : null,
     
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganizationPrerequisitesModel.fromJson(String source) =>
      OrganizationPrerequisitesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrganizationPrerequisitesModel(id: $id,organization_id: $organization_id,min_population_number:$min_population_number,min_population_number:$min_median_salary, max_pollution_taux: $max_pollution_taux,min_security_taux: $min_security_taux,min_total_economy_amount: $min_total_economy_amount,min_stability_int_taux: $min_stability_int_taux,min_stability_international_taux: $min_stability_international_taux,min_pib_amount: $min_pib_amount,min_military_number: $min_military_number)';
  }

  @override
  bool operator ==(covariant OrganizationPrerequisitesModel other) {
    if (identical(this, other)) return true;

    return 
        other.id == id &&
        other.organization_id == organization_id &&
        other.min_population_number == min_population_number &&
        other.min_median_salary == min_median_salary &&
        other.max_pollution_taux == max_pollution_taux &&
        other.min_security_taux == min_security_taux &&
        other.min_total_economy_amount == min_total_economy_amount &&
        other.min_stability_int_taux == min_stability_int_taux &&
        other.min_stability_international_taux == min_stability_international_taux &&
        other.min_pib_amount == min_pib_amount &&
        other.min_military_number == min_military_number &&
        other.continent_name == continent_name;
  }

  @override
  int get hashCode {
    return 
        id.hashCode ^
        organization_id.hashCode ^
        min_population_number.hashCode ^
        min_median_salary.hashCode ^
        max_pollution_taux.hashCode ^
        min_security_taux.hashCode ^
        continent_name.hashCode ^
        min_total_economy_amount.hashCode ^
        min_stability_int_taux.hashCode ^
        min_stability_international_taux.hashCode ^
        min_pib_amount.hashCode ^
        min_military_number.hashCode;
  }
}
