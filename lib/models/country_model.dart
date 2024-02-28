// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CountryModel {
  final int id;
  final String name;
  final String flag_img_path;
  final String continent_name;
  final String capital_name;
  final String map_img_path;
  final String created_at;
  final String updated_at;
  final int political_ideology_pourcentage_parlement;
  final String currency;
  final num currency_taux;
  final int currency_reference_taux;
  final int is_playable;
  final int president_id;

  CountryModel(
      {required this.id,
      required this.name,
      required this.flag_img_path,
      required this.president_id,
      required this.continent_name,
      required this.capital_name,
      required this.map_img_path,
      required this.created_at,
      required this.updated_at,
      required this.is_playable,
      required this.currency,
      required this.currency_taux,
      required this.currency_reference_taux,
      required this.political_ideology_pourcentage_parlement});
  
  CountryModel copyWith(
      {int? id,
      String? name,
      String? flag_img_path,
      int? president_id,
      String? continent_name,
      String? capital_name,
      String? map_img_path,
      String? created_at,
      String? updated_at,
      int? is_playable,
      String? currency,
      num? currency_taux,
      int? currency_reference_taux,
      int? political_ideology_pourcentage_parlement}) {
    return CountryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      flag_img_path: flag_img_path ?? this.flag_img_path,
      president_id: president_id ?? this.president_id,
      continent_name: continent_name ?? this.continent_name,
      capital_name: capital_name ?? this.capital_name,
      map_img_path: map_img_path ?? this.map_img_path,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      is_playable: is_playable ?? this.is_playable,
      currency: currency ?? this.currency,
      currency_taux: currency_taux ?? this.currency_taux,
      currency_reference_taux:
          currency_reference_taux ?? this.currency_reference_taux,
      political_ideology_pourcentage_parlement:
          political_ideology_pourcentage_parlement ??
              this.political_ideology_pourcentage_parlement,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'flag_img_path': flag_img_path,
      'president_id': president_id,
      'continent_name': continent_name,
      'capital_name': capital_name,
      'map_img_path': map_img_path,
      'created_at': created_at,
      'updated_at': updated_at,
      'is_playable': is_playable,
      'currency': currency,
      'currency_taux': currency_taux,
      'currency_reference_taux': currency_reference_taux,
      'political_ideology_pourcentage_parlement':
          political_ideology_pourcentage_parlement
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      flag_img_path: map['flag_img_path'] as String,
      president_id: map['president_id'] as int,
      continent_name: map['continent_name'] as String,
      capital_name: map['capital_name'] as String,
      map_img_path: map['map_img_path'] as String,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
      is_playable: map['is_playable'] as int,
      currency: map['currency'] as String,
      currency_taux: map['currency_taux'] as num,
      currency_reference_taux: map['currency_reference_taux'] as int,
      political_ideology_pourcentage_parlement:
          map['political_ideology_pourcentage_parlement'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, flag_img_path: $flag_img_path, president_id: $president_id, continent_name: $continent_name, capital_name: $capital_name, map_img_path: $map_img_path, created_at :$created_at,updated_at:$updated_at,is_playable:$is_playable,political_ideology_pourcentage_parlement:$political_ideology_pourcentage_parlement,currency: $currency,currency_taux: $currency_taux,currency_reference_taux: $currency_reference_taux)';
  }

  @override
  bool operator ==(covariant CountryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.flag_img_path == flag_img_path &&
        other.president_id == president_id &&
        other.continent_name == continent_name &&
        other.capital_name == capital_name &&
        other.map_img_path == map_img_path &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.is_playable == is_playable &&
        other.currency == currency &&
        other.currency_taux == currency_taux &&
        other.currency_reference_taux == currency_reference_taux &&
        other.political_ideology_pourcentage_parlement ==
            political_ideology_pourcentage_parlement;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        flag_img_path.hashCode ^
        president_id.hashCode ^
        continent_name.hashCode ^
        capital_name.hashCode ^
        map_img_path.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        is_playable.hashCode ^
        currency.hashCode ^
        currency_taux.hashCode ^
        currency_reference_taux.hashCode ^
        political_ideology_pourcentage_parlement.hashCode;
  }
}
