import 'dart:convert';

class PresidentialDebateResponsesModel {
  final int id;
  final int presidential_debate_id;
  final String name;
  final int political_direction;
  PresidentialDebateResponsesModel({
    required this.name,
    required this.presidential_debate_id,
    required this.id,
    required this.political_direction,
  });

  PresidentialDebateResponsesModel copyWith({
    String? name,
    int? political_direction,
    int? id,
    int? presidential_debate_id,
  }) {
    return PresidentialDebateResponsesModel(
      name: name ?? this.name,
      id: id ?? this.id,
      presidential_debate_id: presidential_debate_id ?? this.presidential_debate_id,
      political_direction: political_direction ?? this.political_direction,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'presidential_debate_id': presidential_debate_id,
      'political_direction': political_direction,
    };
  }

  factory PresidentialDebateResponsesModel.fromMap(Map<String, dynamic> map) {
    return PresidentialDebateResponsesModel(
      name: map['name'] as String,
      political_direction: map['political_direction'] as int,
      presidential_debate_id: map['presidential_debate_id'] as int,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PresidentialDebateResponsesModel.fromJson(String source) =>
      PresidentialDebateResponsesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PresidentialDebateResponsesModel(presidential_debate_id:$presidential_debate_id,name: $name, id: $id, political_direction: $political_direction)';

  @override
  bool operator ==(covariant PresidentialDebateResponsesModel other) {
    if (identical(this, other)) return true;

    return other.name == name && 
    other.political_direction ==political_direction && 
    other.presidential_debate_id ==presidential_debate_id && 
    other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ 
  political_direction.hashCode ^ 
  presidential_debate_id.hashCode ^ 
  id.hashCode;
}
