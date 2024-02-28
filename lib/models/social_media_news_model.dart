// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'dart:convert';

class SocialMediaNewsModel {
  final int id;
  final String title;
  final String author_name;
  final int like_number;
  final String social_media_name;
  SocialMediaNewsModel({
    required this.id,
    required this.title,
    required this.author_name,
    required this.like_number,
    required this.social_media_name,
  });

  SocialMediaNewsModel copyWith({
    int? id,
    String? title,
    String? author_name,
    int? like_number,
    String? social_media_name,
  }) {
    return SocialMediaNewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author_name: author_name ?? this.author_name,
      like_number: like_number ?? this.like_number,
      social_media_name: social_media_name ?? this.social_media_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author_name': author_name,
      'like_number': like_number,
      'social_media_name': social_media_name,
    };
  }

  factory SocialMediaNewsModel.fromMap(Map<String, dynamic> map) {
    return SocialMediaNewsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      author_name: map['author_name'] as String,
      like_number: map['like_number'] as int,
      social_media_name: map['social_media_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMediaNewsModel.fromJson(String source) =>
      SocialMediaNewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SocialMediaNewsModel(id: $id,title: $title,author_name: $author_name,like_number: $like_number, social_media_name: $social_media_name)';

  @override
  bool operator ==(covariant SocialMediaNewsModel other) {
    if (identical(this, other)) return true;

    return 
    other.id == id && 
    other.title == title && 
    other.author_name == author_name && 
    other.like_number == like_number && 
    other.social_media_name == social_media_name;
  }

  @override
  int get hashCode => 
  id.hashCode ^ 
  title.hashCode ^ 
  author_name.hashCode ^ 
  like_number.hashCode ^ 
  social_media_name.hashCode;
}
