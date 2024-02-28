// ignore_for_file: non_constant_identifier_enter_dates

import 'dart:convert';

class OrganizationMembersModel {
  final int id;
  final String? enter_date;
  final String? status;
  final int organization_id;
  final int country_id;

  OrganizationMembersModel({
    required this.enter_date,
    required this.status,
    required this.id,
    required this.organization_id,
    required this.country_id,
  });

  OrganizationMembersModel copyWith({
    String? enter_date,
    String? status,
    int? id,
    int? organization_id,
    int? country_id,
  }) {
    return OrganizationMembersModel(
      enter_date: enter_date ?? this.enter_date,
      status: status ?? this.status,
      id: id ?? this.id,
      organization_id: organization_id ?? this.organization_id,
      country_id: country_id ?? this.country_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'enter_date': enter_date,
      'status': status,
      'id': id,
      'organization_id': organization_id,
      'country_id': country_id,
    };
  }

  factory OrganizationMembersModel.fromMap(Map<String, dynamic> map) {
    return OrganizationMembersModel(
      enter_date: map['enter_date'] as String?,
      status: map['status'] as String?,
      id: map['id'] as int,
      organization_id: map['organization_id'] as int,
      country_id: map['country_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrganizationMembersModel.fromJson(String source) =>
      OrganizationMembersModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrganizationMembersModel(enter_date: $enter_date,status:$status id: $id,  organization_id: $organization_id,   country_id: $country_id)';

  @override
  bool operator ==(covariant OrganizationMembersModel other) {
    if (identical(this, other)) return true;

    return other.enter_date == enter_date &&
        other.organization_id == organization_id &&
        other.country_id == country_id &&
        other.id == id;
  }

  @override
  int get hashCode =>
      enter_date.hashCode ^
      id.hashCode ^
      organization_id.hashCode ^
      country_id.hashCode;
}
