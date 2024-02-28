// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class ElectionModel {
  final int? id;
  final int? person_me_id;
  final int person_opponent_id;
  final int country_id;
  final int result_person_me;
  final int result_person_opponent;
  final String? date;
  ElectionModel({
     this.date,
     this.id,
    required this.person_me_id,
    required this.person_opponent_id,
    required this.country_id,
    required this.result_person_me,
    required this.result_person_opponent,
  });

  ElectionModel copyWith({
    String? date,
    int? person_me_id,
    int? person_opponent_id,
    int? id,
    int? country_id,
    int? result_person_me,
    int? result_person_opponent,
  }) {
    return ElectionModel(
      date: date ?? this.date,
      id: id ?? this.id,
      country_id: country_id ?? this.country_id,
      person_me_id: person_me_id ?? this.person_me_id,
      person_opponent_id: person_opponent_id ?? this.person_opponent_id,
      result_person_me: result_person_me ?? this.result_person_me,
      result_person_opponent: result_person_opponent ?? this.result_person_opponent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'id': id,
      'person_me_id': person_me_id,
      'person_opponent_id': person_opponent_id,
      'country_id': country_id,
      'result_person_me': result_person_me,
      'result_person_opponent': result_person_opponent,
    };
  }

  factory ElectionModel.fromMap(Map<String, dynamic> map) {
    return ElectionModel(
date: map['date'] != null ? map['date'] as String : '',
      id: map['id'] as int,
      person_me_id: map['person_me_id'] as int,
      person_opponent_id: map['person_opponent_id'] as int,
      country_id: map['country_id'] as int,
      result_person_me: map['result_person_me'] as int,
      result_person_opponent: map['result_person_opponent'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectionModel.fromJson(String source) =>
      ElectionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ElectionModel(date: $date, id: $id,person_me_id: $person_me_id,person_opponent_id: $person_opponent_id,country_id: $country_id,result_person_me: $result_person_me,result_person_opponent: $result_person_opponent)';

  @override
  bool operator ==(covariant ElectionModel other) {
    if (identical(this, other)) return true;

    return 
    other.person_me_id == person_me_id && 
    other.person_opponent_id == person_opponent_id && 
    other.country_id == country_id && 
    other.result_person_me == result_person_me && 
    other.result_person_opponent == result_person_opponent && 
    other.date == date && 
    
    other.id == id;
  }

  @override
  int get hashCode => 
  person_me_id.hashCode ^ 
  person_opponent_id.hashCode ^ 
  country_id.hashCode ^ 
  result_person_me.hashCode ^ 
  result_person_opponent.hashCode ^ 
  date.hashCode ^ 
  id.hashCode;
}
