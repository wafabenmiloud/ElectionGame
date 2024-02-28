// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CountryMinisterModel {
  final int id;
  final int country_id;
  final String name;
  final String img_path;
  final int profits;
  final int expenses;
  final int incomes;
  CountryMinisterModel(
      {required this.id,
      required this.country_id,
      required this.name,
      required this.img_path,
      required this.profits,
      required this.expenses,
      required this.incomes});

  CountryMinisterModel copyWith({
    int? id,
    int? country_id,
    String? name,
    String? img_path,
    int? profits,
    int? expenses,
    int? incomes,
  }) {
    return CountryMinisterModel(
      id: id ?? this.id,
      country_id: country_id ?? this.country_id,
      name: name ?? this.name,
      img_path: img_path ?? this.img_path,
      profits: profits ?? this.profits,
      expenses: expenses ?? this.expenses,
      incomes: incomes ?? this.incomes,

    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_id': country_id,
      'name': name,
      'profits': profits,
      'expenses': expenses,
      'incomes': incomes,
    };
  }

  factory CountryMinisterModel.fromMap(Map<String, dynamic> map) {
    return CountryMinisterModel(
      id: map['id'] as int,
      country_id: map['country_id'] as int,
      profits: map['profits'] as int,
      expenses: map['expenses'] as int,
      incomes: map['incomes'] as int,
      name: map['name'] as String,
      img_path: map['img_path'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryMinisterModel.fromJson(String source) =>
      CountryMinisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MinisterModel(id: $id,country_id: $country_id,name: $name, image_path: $img_path,profits:$profits,expenses:$expenses,incomes:$incomes)';

  @override
  bool operator ==(covariant CountryMinisterModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.country_id == country_id &&
        other.expenses == expenses &&
        other.profits == profits &&
        other.incomes == incomes &&
        other.name == name &&
        other.img_path == img_path;
  }

  @override
  int get hashCode =>
      id.hashCode ^ 
      country_id.hashCode ^ 
      profits.hashCode ^ 
      expenses.hashCode ^ 
      incomes.hashCode ^ 
      name.hashCode ^ img_path.hashCode;
}
