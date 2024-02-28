// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class OrganizationModel {
  final int id;
  final String name;

  final int director_id;
  final int relationship_strength;
  final String image_path;
  final int total_funds_amount;
  final int loan_interest_rate;
  final int is_only_bank;

  OrganizationModel({
    required this.name,
    required this.id,
    required this.director_id,
    required this.relationship_strength,
    required this.image_path,
    required this.total_funds_amount,
    required this.loan_interest_rate,
    required this.is_only_bank,
  });

  OrganizationModel copyWith({
    String? name,
    int? id,
    int? director_id,
    int? relationship_strength,
    String? image_path,
    int? total_funds_amount,
    int? loan_interest_rate,
    int? is_only_bank,
  }) {
    return OrganizationModel(
      name: name ?? this.name,
      id: id ?? this.id,
      director_id: director_id ?? this.director_id,
      relationship_strength:
          relationship_strength ?? this.relationship_strength,
      image_path: image_path ?? this.image_path,
      total_funds_amount: total_funds_amount ?? this.total_funds_amount,
      loan_interest_rate: loan_interest_rate ?? this.loan_interest_rate,
      is_only_bank: is_only_bank ?? this.is_only_bank,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'director_id': director_id,
      'relationship_strength': relationship_strength,
      'image_path': image_path,
      'total_funds_amount': total_funds_amount,
      'loan_interest_rate': loan_interest_rate,
      'is_only_bank': is_only_bank,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      name: map['name'] as String,
      id: map['id'] as int,
      director_id: map['director_id'] as int,
      relationship_strength: map['relationship_strength'] as int,
      image_path: map['image_path'] as String,
      total_funds_amount: map['total_funds_amount'] as int,
      loan_interest_rate: map['loan_interest_rate'] as int,
      is_only_bank: map['is_only_bank'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganizationModel.fromJson(String source) =>
      OrganizationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrganizationModel(name: $name, id: $id,  director_id: $director_id,relationship_strength: $relationship_strength,     image_path: $image_path,    total_funds_amount: $total_funds_amount,    loan_interest_rate: $loan_interest_rate,is_only_bank: $is_only_bank)';

  @override
  bool operator ==(covariant OrganizationModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.director_id == director_id &&
        other.relationship_strength == relationship_strength &&
        other.image_path == image_path &&
        other.total_funds_amount == total_funds_amount &&
        other.loan_interest_rate == loan_interest_rate &&
        other.is_only_bank == is_only_bank &&
        other.id == id;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      director_id.hashCode ^
      relationship_strength.hashCode ^
      image_path.hashCode ^
      total_funds_amount.hashCode ^
      loan_interest_rate.hashCode ^
      is_only_bank.hashCode;
}
