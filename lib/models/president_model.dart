// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class PresidentModel {
  final int person_id;
  final String end_mandat_date;
  
  PresidentModel({
    required this.person_id,
    required this.end_mandat_date,
  });

  PresidentModel copyWith({
    int? person_id,
    String? end_mandat_date,
  }) {
    return PresidentModel(
      person_id: person_id ?? this.person_id,
      end_mandat_date: end_mandat_date ?? this.end_mandat_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'person_id': person_id,
      'end_mandat_date': end_mandat_date,
    };
  }

  factory PresidentModel.fromMap(Map<String, dynamic> map) {
    return PresidentModel(
      person_id: map['person_id'] as int,
      end_mandat_date: map['end_mandat_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PresidentModel.fromJson(String source) =>
      PresidentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PresidentModel(person_id: $person_id,end_mandat_date: $end_mandat_date)';
  }

  @override
  bool operator ==(covariant PresidentModel other) {
    if (identical(this, other)) return true;

    return 
        other.person_id == person_id &&
        other.end_mandat_date == end_mandat_date;
  }

  @override
  int get hashCode {
    return  
    person_id.hashCode  ^ 
    end_mandat_date.hashCode;
  }
}
