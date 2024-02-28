// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CountryInfoModel {
  final int? id;
  final int? country_id;
  final int? reputation;
  final int? ambition;

  final String? culinary_specialities;
  final String? capital;
  final int? area;
  final String? governement_type;
  final String? national_anthem_name;
  final String? languages;
  final String? continent_img_path;
  final String? symbol_img_path;
  final int? army_size;
  final int? life_expectancy;

  CountryInfoModel({
    required this.id,
    required this.country_id,
    required this.culinary_specialities,
    required this.capital,
    required this.ambition,
    required this.area,
    required this.governement_type,
    required this.national_anthem_name,
    required this.languages,
    required this.continent_img_path,
    required this.reputation,
    required this.symbol_img_path,
    required this.army_size,
    required this.life_expectancy,
  });

  CountryInfoModel copyWith({
    int? id,
    int? country_id,
    String? culinary_specialities,
    String? capital,
    int? ambition,
    int? area,
    String? governement_type,
    String? national_anthem_name,
    String? languages,
    String? continent_img_path,
    int? reputation,
    String? symbol_img_path,
    int? army_size,
    int? life_expectancy,
  }) {
    return CountryInfoModel(
      id: id ?? this.id,
      country_id: country_id ?? this.country_id,
      culinary_specialities:
          culinary_specialities ?? this.culinary_specialities,
      capital: capital ?? this.capital,
      ambition: ambition ?? this.ambition,
      area: area ?? this.area,
      governement_type: governement_type ?? this.governement_type,
      national_anthem_name: national_anthem_name ?? this.national_anthem_name,
      languages: languages ?? this.languages,
      continent_img_path: continent_img_path ?? this.continent_img_path,
      reputation: reputation ?? this.reputation,
      symbol_img_path: symbol_img_path ?? this.symbol_img_path,
      army_size: army_size ?? this.army_size,
      life_expectancy: life_expectancy ?? this.life_expectancy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_id': country_id,
      'culinary_specialities': culinary_specialities,
      'capital': capital,
      'ambition': ambition,
      'area': area,
      'governement_type': governement_type,
      'national_anthem_name': national_anthem_name,
      'languages': languages,
      'continent_img_path': continent_img_path,
      'reputation': reputation,
      'symbol_img_path': symbol_img_path,
      'army_size': army_size,
      'life_expectancy': life_expectancy,
    };
  }

  factory CountryInfoModel.fromMap(Map<String, dynamic> map) {
    return CountryInfoModel(
      id: map['id'] as int?,
      country_id: map['country_id'] as int?,
      culinary_specialities: map['culinary_specialities'] as String?,
      capital: map['capital'] as String?,
      ambition: map['ambition'] as int?,
      area: map['area'] as int?,
      governement_type: map['governement_type'] as String?,
      national_anthem_name: map['national_anthem_name'] as String?,
      languages: map['languages'] as String?,
      continent_img_path: map['continent_img_path'] as String?,
      reputation: map['reputation'] as int?,
      symbol_img_path: map['symbol_img_path'] as String?,
      army_size: map['army_size'] as int?,
      life_expectancy: map['life_expectancy'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryInfoModel.fromJson(String source) =>
      CountryInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryInfoModel(id: $id,country_id:$country_id, culinary_specialities: $culinary_specialities, capital: $capital, ambition: $ambition, area: $area, governement_type: $governement_type, national_anthem_name: $national_anthem_name, languages :$languages,continent_img_path:$continent_img_path,reputation:$reputation,symbol_img_path: $symbol_img_path,army_size: $army_size,life_expectancy:$life_expectancy)';
  }

  @override
  bool operator ==(covariant CountryInfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.country_id == country_id &&
        other.culinary_specialities == culinary_specialities &&
        other.capital == capital &&
        other.ambition == ambition &&
        other.area == area &&
        other.governement_type == governement_type &&
        other.national_anthem_name == national_anthem_name &&
        other.languages == languages &&
        other.continent_img_path == continent_img_path &&
        other.reputation == reputation &&
        other.army_size == army_size &&
        other.life_expectancy == life_expectancy &&
        other.symbol_img_path == symbol_img_path;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        country_id.hashCode ^
        culinary_specialities.hashCode ^
        capital.hashCode ^
        ambition.hashCode ^
        area.hashCode ^
        governement_type.hashCode ^
        national_anthem_name.hashCode ^
        languages.hashCode ^
        continent_img_path.hashCode ^
        reputation.hashCode ^
        army_size.hashCode ^
        life_expectancy.hashCode ^
        symbol_img_path.hashCode;
  }
}
