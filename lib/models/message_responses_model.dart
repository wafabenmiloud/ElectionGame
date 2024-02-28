import 'dart:convert';

class MessageResponsesModel {
  final int id;
  final int message_id;
  final int relationship_strength;
  final String content;
  MessageResponsesModel({
    required this.id,
    required this.message_id,
    required this.relationship_strength,
    required this.content,
  });

  MessageResponsesModel copyWith({
    int? id,
    int? message_id,
    int? relationship_strength,
    String? content,
  }) {
    return MessageResponsesModel(
      id: id ?? this.id,
      message_id: message_id ?? this.message_id,
      relationship_strength:
          relationship_strength ?? this.relationship_strength,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message_id': message_id,
      'relationship_strength': relationship_strength,
      'content': content,
    };
  }

  factory MessageResponsesModel.fromMap(Map<String, dynamic> map) {
    return MessageResponsesModel(
      id: map['id'] as int,
      message_id: map['message_id'] as int,
      relationship_strength: map['relationship_strength'] as int,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageResponsesModel.fromJson(String source) =>
      MessageResponsesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MessageResponsesModel( id: $id,relationship_strength: $relationship_strength,content: $content,message_id: $message_id)';

  @override
  bool operator ==(covariant MessageResponsesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.relationship_strength == relationship_strength &&
        other.content == content &&
        other.message_id == message_id;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      message_id.hashCode ^
      relationship_strength.hashCode ^
      content.hashCode;
}
