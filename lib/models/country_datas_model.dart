// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CountryDatasModel {
  final int? id;
  final int? population_number;
  final int? median_salary;
  final int? pollution_taux;
  final int? security_taux;
  final int? education_taux;
  final int? healthy_taux;
  final int? total_economy_amount;
  final int? stability_int_taux;
  final int? stability_international_taux;
  final int? justicy_taux;
  final int? smic_salary_amount;
  final int? pib_amount;
  final int? military_number;
  final int? population_number_per_round;
  final int? pollution_taux_per_round;
  final int? security_taux_per_round;
  final int? education_taux_per_round;
  final int? healthy_taux_per_round;
  final int? total_economy_amount_per_round;
  final int? stability_int_taux_per_round;
  final int? stability_international_taux_per_round;
  final int? justicy_taux_per_round;
  final int? pib_amount_per_round;
  final int? country_id;

  CountryDatasModel(
      {required this.id,
      required this.country_id,
      required this.population_number,
      required this.median_salary,
      required this.pollution_taux,
      required this.security_taux,
      required this.education_taux,
      required this.healthy_taux,
      required this.total_economy_amount,
      required this.stability_int_taux,
      required this.stability_international_taux,
      required this.justicy_taux,
      required this.smic_salary_amount,
      required this.pib_amount,
      required this.military_number,
      required this.population_number_per_round,
      required this.pollution_taux_per_round,
      required this.security_taux_per_round,
      required this.education_taux_per_round,
      required this.healthy_taux_per_round,
      required this.total_economy_amount_per_round,
      required this.stability_int_taux_per_round,
      required this.stability_international_taux_per_round,
      required this.justicy_taux_per_round,
      required this.pib_amount_per_round});

  CountryDatasModel copyWith(
      {int? id,
      int? country_id,
      int? population_number,
      int? median_salary,
      int? pollution_taux,
      int? security_taux,
      int? education_taux,
      int? healthy_taux,
      int? total_economy_amount,
      int? stability_int_taux,
      int? stability_international_taux,
      int? justicy_taux,
      int? smic_salary_amount,
      int? pib_amount,
      int? military_number,
      int? population_number_per_round,
      int? pollution_taux_per_round,
      int? security_taux_per_round,
      int? education_taux_per_round,
      int? healthy_taux_per_round,
      int? total_economy_amount_per_round,
      int? stability_int_taux_per_round,
      int? stability_international_taux_per_round,
      int? justicy_taux_per_round,
      int? pib_amount_per_round}) {
    return CountryDatasModel(
      id: id ?? this.id,
      country_id: country_id ?? this.country_id,
      population_number: population_number ?? this.population_number,
      median_salary: median_salary ?? this.median_salary,
      pollution_taux: pollution_taux ?? this.pollution_taux,
      security_taux: security_taux ?? this.security_taux,
      education_taux: education_taux ?? this.education_taux,
      healthy_taux: healthy_taux ?? this.healthy_taux,
      total_economy_amount: total_economy_amount ?? this.total_economy_amount,
      stability_int_taux: stability_int_taux ?? this.stability_int_taux,
      stability_international_taux:
          stability_international_taux ?? this.stability_international_taux,
      justicy_taux: justicy_taux ?? this.justicy_taux,
      smic_salary_amount: smic_salary_amount ?? this.smic_salary_amount,
      pib_amount: pib_amount ?? this.pib_amount,
      military_number: military_number ?? this.military_number,
      population_number_per_round:
          population_number_per_round ?? this.population_number_per_round,
      pollution_taux_per_round:
          pollution_taux_per_round ?? this.pollution_taux_per_round,
      security_taux_per_round:
          security_taux_per_round ?? this.security_taux_per_round,
      education_taux_per_round:
          education_taux_per_round ?? this.education_taux_per_round,
      healthy_taux_per_round:
          healthy_taux_per_round ?? this.healthy_taux_per_round,
      total_economy_amount_per_round:
          total_economy_amount_per_round ?? this.total_economy_amount_per_round,
      stability_int_taux_per_round:
          stability_int_taux_per_round ?? this.stability_int_taux_per_round,
      stability_international_taux_per_round:
          stability_international_taux_per_round ??
              this.stability_international_taux_per_round,
      justicy_taux_per_round:
          justicy_taux_per_round ?? this.justicy_taux_per_round,
      pib_amount_per_round: pib_amount_per_round ?? this.pib_amount_per_round,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_id': country_id,
      'population_number': population_number,
      'median_salary': median_salary,
      'pollution_taux': pollution_taux,
      'security_taux': security_taux,
      'education_taux': education_taux,
      'healthy_taux': healthy_taux,
      'total_economy_amount': total_economy_amount,
      'stability_int_taux': stability_int_taux,
      'stability_international_taux': stability_international_taux,
      'justicy_taux': justicy_taux,
      'smic_salary_amount': smic_salary_amount,
      'pib_amount': pib_amount,
      'military_number': military_number,
      'population_number_per_round': population_number_per_round,
      'pollution_taux_per_round': pollution_taux_per_round,
      'security_taux_per_round': security_taux_per_round,
      'education_taux_per_round': education_taux_per_round,
      'healthy_taux_per_round': healthy_taux_per_round,
      'total_economy_amount_per_round': total_economy_amount_per_round,
      'stability_int_taux_per_round': stability_int_taux_per_round,
      'stability_international_taux_per_round':
          stability_international_taux_per_round,
      'justicy_taux_per_round': justicy_taux_per_round,
      'pib_amount_per_round': pib_amount_per_round,
    };
  }

  factory CountryDatasModel.fromMap(Map<String, dynamic> map) {
    return CountryDatasModel(
      id: map['id'] != null ? map['id'] as int : null,
      country_id: map['country_id'] != null ? map['country_id'] as int : null,
      population_number: map['population_number'] != null
          ? map['population_number'] as int
          : null,
      median_salary:
          map['median_salary'] != null ? map['median_salary'] as int : null,
      pollution_taux:
          map['pollution_taux'] != null ? map['pollution_taux'] as int : null,
      security_taux:
          map['security_taux'] != null ? map['security_taux'] as int : null,
      education_taux:
          map['education_taux'] != null ? map['education_taux'] as int : null,
      healthy_taux:
          map['healthy_taux'] != null ? map['healthy_taux'] as int : null,
      total_economy_amount: map['total_economy_amount'] != null
          ? map['total_economy_amount'] as int
          : null,
      stability_int_taux: map['stability_int_taux'] != null
          ? map['stability_int_taux'] as int
          : null,
      stability_international_taux: map['stability_international_taux'] != null
          ? map['stability_international_taux'] as int
          : null,
      justicy_taux:
          map['justicy_taux'] != null ? map['justicy_taux'] as int : null,
      smic_salary_amount: map['smic_salary_amount'] != null
          ? map['smic_salary_amount'] as int
          : null,
      pib_amount: map['pib_amount'] != null ? map['pib_amount'] as int : null,
      military_number:
          map['military_number'] != null ? map['military_number'] as int : null,
      population_number_per_round: map['population_number_per_round'] != null
          ? map['population_number_per_round'] as int
          : null,
      pollution_taux_per_round: map['pollution_taux_per_round'] != null
          ? map['pollution_taux_per_round'] as int
          : null,
      security_taux_per_round: map['security_taux_per_round'] != null
          ? map['security_taux_per_round'] as int
          : null,
      education_taux_per_round: map['education_taux_per_round'] != null
          ? map['education_taux_per_round'] as int
          : null,
      healthy_taux_per_round: map['healthy_taux_per_round'] != null
          ? map['healthy_taux_per_round'] as int
          : null,
      total_economy_amount_per_round:
          map['total_economy_amount_per_round'] != null
              ? map['total_economy_amount_per_round'] as int
              : null,
      stability_int_taux_per_round: map['stability_int_taux_per_round'] != null
          ? map['stability_int_taux_per_round'] as int
          : null,
      stability_international_taux_per_round:
          map['stability_international_taux_per_round'] != null
              ? map['stability_international_taux_per_round'] as int
              : null,
      justicy_taux_per_round: map['justicy_taux_per_round'] != null
          ? map['justicy_taux_per_round'] as int
          : null,
      pib_amount_per_round: map['pib_amount_per_round'] != null
          ? map['pib_amount_per_round'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryDatasModel.fromJson(String source) =>
      CountryDatasModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryDatasModel(id: $id,country_id: $country_id,population_number:$population_number,population_number:$median_salary, pollution_taux: $pollution_taux,security_taux: $security_taux,education_taux: $education_taux,healthy_taux: $healthy_taux,total_economy_amount: $total_economy_amount,stability_int_taux: $stability_int_taux,stability_international_taux: $stability_international_taux,justicy_taux: $justicy_taux,smic_salary_amount: $smic_salary_amount,pib_amount: $pib_amount,military_number: $military_number,population_number_per_round: $population_number_per_round,pollution_taux_per_round: $pollution_taux_per_round,security_taux_per_round: $security_taux_per_round,education_taux_per_round: $education_taux_per_round,healthy_taux_per_round: $healthy_taux_per_round,total_economy_amount_per_round: $total_economy_amount_per_round,stability_int_taux_per_round: $stability_int_taux_per_round,stability_international_taux_per_round:$stability_international_taux_per_round,justicy_taux_per_round: $justicy_taux_per_round,pib_amount_per_round: $pib_amount_per_round)';
  }

  @override
  bool operator ==(covariant CountryDatasModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.country_id == country_id &&
        other.population_number == population_number &&
        other.median_salary == median_salary &&
        other.pollution_taux == pollution_taux &&
        other.security_taux == security_taux &&
        other.education_taux == education_taux &&
        other.healthy_taux == healthy_taux &&
        other.total_economy_amount == total_economy_amount &&
        other.stability_int_taux == stability_int_taux &&
        other.stability_international_taux == stability_international_taux &&
        other.justicy_taux == justicy_taux &&
        other.smic_salary_amount == smic_salary_amount &&
        other.pib_amount == pib_amount &&
        other.military_number == military_number &&
        other.population_number_per_round == population_number_per_round &&
        other.pollution_taux_per_round == pollution_taux_per_round &&
        other.security_taux_per_round == security_taux_per_round &&
        other.education_taux_per_round == education_taux_per_round &&
        other.healthy_taux_per_round == healthy_taux_per_round &&
        other.total_economy_amount_per_round ==
            total_economy_amount_per_round &&
        other.stability_int_taux_per_round == stability_int_taux_per_round &&
        other.stability_international_taux_per_round ==
            stability_international_taux_per_round &&
        other.justicy_taux_per_round == justicy_taux_per_round &&
        other.pib_amount_per_round == pib_amount_per_round;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        country_id.hashCode ^
        population_number.hashCode ^
        median_salary.hashCode ^
        pollution_taux.hashCode ^
        security_taux.hashCode ^
        education_taux.hashCode ^
        healthy_taux.hashCode ^
        total_economy_amount.hashCode ^
        stability_int_taux.hashCode ^
        stability_international_taux.hashCode ^
        justicy_taux.hashCode ^
        smic_salary_amount.hashCode ^
        pib_amount.hashCode ^
        military_number.hashCode ^
        population_number_per_round.hashCode ^
        pollution_taux_per_round.hashCode ^
        security_taux_per_round.hashCode ^
        education_taux_per_round.hashCode ^
        healthy_taux_per_round.hashCode ^
        total_economy_amount_per_round.hashCode ^
        stability_int_taux_per_round.hashCode ^
        stability_international_taux_per_round.hashCode ^
        justicy_taux_per_round.hashCode ^
        pib_amount_per_round.hashCode;
  }
}
