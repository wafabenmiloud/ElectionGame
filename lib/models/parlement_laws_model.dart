import 'dart:convert';

class ParlementLawsModel {
  final int id;
  final int law_id;
  final int new_value;
  final int old_value;
  final int true_voted;
  final int false_voted;
  final int neutral_value;
  final String status;
  final String added_date;
  final String voting_date;

  ParlementLawsModel({
    required this.id,
    required this.law_id,
    required this.new_value,
    required this.old_value,
    required this.true_voted,
    required this.false_voted,
    required this.neutral_value,
    required this.status,
    required this.added_date,
    required this.voting_date,
  });

  ParlementLawsModel copyWith({
     int? id,
   int? law_id,
   int? new_value,
   int? old_value,
   int? true_voted,
   int? false_voted,
   int? neutral_value,
   String? status,
   String? added_date,
   String? voting_date,
  }) {
    return ParlementLawsModel(
      id: id ?? this.id,
      law_id: law_id ?? this.law_id,
      new_value: new_value ?? this.new_value,
      old_value: old_value ?? this.old_value,
      true_voted: true_voted ?? this.true_voted,
      false_voted: false_voted ?? this.false_voted,
      neutral_value: neutral_value ?? this.neutral_value,
      status: status ?? this.status,
      added_date: added_date ?? this.added_date,
      voting_date: voting_date ?? this.voting_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'law_id': law_id,
      'new_value': new_value,
      'old_value': old_value,
      'true_voted': true_voted,
      'false_voted': false_voted,
      'neutral_value': neutral_value,
      'status': status,
      'added_date': added_date,
      'voting_date': voting_date,
    };
  }

  factory ParlementLawsModel.fromMap(Map<String, dynamic> map) {
    return ParlementLawsModel(
      id: map['id'] as int,
      law_id: map['law_id'] as int,
      new_value: map['new_value'] as int,
      old_value: map['old_value'] as int,
      true_voted: map['true_voted'] as int,
      false_voted: map['false_voted'] as int,
      neutral_value: map['neutral_value'] as int,
      status: map['status'] as String,
      added_date: map['added_date'] as String,
      voting_date: map['voting_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParlementLawsModel.fromJson(String source) =>
      ParlementLawsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ParlementLawsModel( id: $id,law_id: $law_id,new_value: $new_value,old_value: $old_value,true_voted: $true_voted,false_voted: $false_voted,neutral_value: $neutral_value,status:$status,added_date:$added_date,voting_date:$voting_date)';

  @override
  bool operator ==(covariant ParlementLawsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.law_id == law_id &&
        other.new_value == new_value &&
        other.old_value == old_value &&
        other.true_voted == true_voted &&
        other.false_voted == false_voted &&
        other.status == status &&
        other.added_date == added_date &&
        other.voting_date == voting_date &&
        other.neutral_value == neutral_value;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      law_id.hashCode ^
      new_value.hashCode ^
      old_value.hashCode ^
      true_voted.hashCode ^
      false_voted.hashCode ^
      status.hashCode ^
      added_date.hashCode ^
      voting_date.hashCode ^
      neutral_value.hashCode;
}
