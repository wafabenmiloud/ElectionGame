import 'dart:convert';

class PresidentialDebateModel {
  final int id;
  final String content;
  PresidentialDebateModel({
    required this.content,
    required this.id,
  });

  PresidentialDebateModel copyWith({
    String? content,
    int? id,
  }) {
    return PresidentialDebateModel(
      content: content ?? this.content,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'id': id,
    };
  }

  factory PresidentialDebateModel.fromMap(Map<String, dynamic> map) {
    return PresidentialDebateModel(
      content: map['content'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PresidentialDebateModel.fromJson(String source) =>
      PresidentialDebateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PresidentialDebateModel(content: $content, id: $id)';

  @override
  bool operator ==(covariant PresidentialDebateModel other) {
    if (identical(this, other)) return true;

    return other.content == content && other.id == id;
  }

  @override
  int get hashCode => content.hashCode ^ id.hashCode;
}
