import 'dart:convert';

class NewsSentModel {
  final int id;
  final int news_id;
  final int country_id;
  final int author_id;
  final String sent_date;
  NewsSentModel({
    required this.id,
    required this.news_id,
    required this.country_id,
    required this.author_id,
    required this.sent_date,
  });

  NewsSentModel copyWith({
    int? id,
   int? news_id,
   int? country_id,
   int? author_id,
   String? sent_date,
  }) {
    return NewsSentModel(
      id: id ?? this.id,
      news_id: news_id ?? this.news_id,
      country_id: country_id ?? this.country_id,
      author_id: author_id ?? this.author_id,
      sent_date: sent_date ?? this.sent_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'news_id': news_id,
      'country_id': country_id,
      'author_id': author_id,
      'sent_date': sent_date,
    };
  }

  factory NewsSentModel.fromMap(Map<String, dynamic> map) {
    return NewsSentModel(
      id: map['id'] as int,
      news_id: map['news_id'] as int,
      country_id: map['country_id'] as int,
      author_id: map['author_id'] as int,
      sent_date: map['sent_date'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsSentModel.fromJson(String source) =>
      NewsSentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NewsSentModel(id: $id,news_id: $news_id,country_id: $country_id,author_id: $author_id,sent_date: $sent_date)';

  @override
  bool operator ==(covariant NewsSentModel other) {
    if (identical(this, other)) return true;

    return other.id == id && 
    other.news_id == news_id && 
    other.country_id == country_id && 
    other.author_id == author_id && 
    other.sent_date == sent_date;
  }

  @override
  int get hashCode => id.hashCode ^ 
  news_id.hashCode ^ 
  country_id.hashCode ^ 
  author_id.hashCode ^ 
  sent_date.hashCode;
}
