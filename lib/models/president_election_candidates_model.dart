import 'dart:convert';

class PresidentElectionCandidatesModel {
  final int id;
  final int person_id;
  final int country_id;
  final String? election_date;
  PresidentElectionCandidatesModel({
    required this.election_date,
    required this.id,
    required this.person_id,
    required this.country_id,
  });

  PresidentElectionCandidatesModel copyWith({
    String? election_date,
    int? id,
    int? person_id,
    int? country_id,
  }) {
    return PresidentElectionCandidatesModel(
      election_date: election_date ?? this.election_date,
      id: id ?? this.id,
      person_id: person_id ?? this.person_id,
      country_id: country_id ?? this.country_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'election_date': election_date,
      'id': id,
      'person_id': person_id,
      'country_id': country_id,
    };
  }

  factory PresidentElectionCandidatesModel.fromMap(Map<String, dynamic> map) {
    return PresidentElectionCandidatesModel(
      election_date: map['election_date'] as String?,
      id: map['id'] as int,
      person_id: map['person_id'] as int,
      country_id: map['country_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PresidentElectionCandidatesModel.fromJson(String source) =>
      PresidentElectionCandidatesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PresidentElectionCandidatesModel(election_date: $election_date, id: $id, person_id: $person_id, country_id: $country_id)';

  @override
  bool operator ==(covariant PresidentElectionCandidatesModel other) {
    if (identical(this, other)) return true;

    return 
    other.election_date == election_date && 
    other.person_id == person_id && 
    other.country_id == country_id && 
    other.id == id;
  }

  @override
  int get hashCode => 
  election_date.hashCode ^ 
  person_id.hashCode ^ 
  country_id.hashCode ^ 
  id.hashCode;
}
